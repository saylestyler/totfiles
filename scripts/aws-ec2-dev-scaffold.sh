#!/bin/bash
# see https://github.com/aws-samples/awscli-reinvent-examples

docs="usage: dev-ec2-instance [setup]

This command makes it easy to launch dev EC2 instances
that can be used for testing purposes, debugging, etc.

You can run this command with no arguments to launch a new
instance.  If you do this, then:

* The latest Amazon Linux AMI will be used.
* The id_rsa keypair will be used.
* The first security group tagged with
  dev-ec2-instance:non-windows will be used.
* The IAM role named \"dev-ec2-instance\" will be used.

"
set -e

readonly KEY_NAME="id_rsa"
readonly INSTANCE_TYPE="m3.medium"
readonly ROLE_NAME="dev-ec2-instance"


usage() {
  echo "$docs"
}


errexit() {
  echo "error: $(basename "$0") (line ${LINENO}): ${1:-"Unknown Error"}" 1>&2
  exit 1
}


wait_for_port() {
  local port="$2"
  local host="$1"
  while ! nc -z "$host" "$port" >/dev/null; do
    sleep 5
  done
}


find_tagged_ec2_group() {
  aws ec2 describe-security-groups \
    --filter Name=tag:dev-ec2-instance,Values=linux \
    --query "SecurityGroups[].GroupId | [0]" \
    --output text

}


ssh_to_instance() {
  # First we'll look for the SSH key fingerprint in the
  # console output before SSHing to the instance.
  local instance_id="$1"
  local hostname="$2"
  echo -n "Waiting for console output to be available..."
  aws ec2 wait console-output-available --instance-id "$instance_id"
  echo "DONE"
  expected_fingerprint=$(aws ec2 get-console-output \
    --instance-id "$instance_id" --query Output --output text \
    | grep '^ec2.*RSA' | cut -d ' ' -f 3)
  ssh-keyscan -t rsa "$hostname" > "/tmp/${instance_id}.pub"
  actual_fingerprint_line=$(ssh-keygen -lf "/tmp/${instance_id}.pub")
  actual_fingerprint=$(cut -d' ' -f 2 <<< "$actual_fingerprint_line")
  if [ "$expected_fingerprint" != "$actual_fingerprint" ]; then
    errexit "SSH fingerprint does not match for $hostname"
  fi
  cat < "/tmp/${instance_id}.pub" >> ~/.ssh/known_hosts
  # Only Mac OS X supported for desktop notifications for now.
  # You can "brew install terminal-notifier" if you want
  # desktop notifications on a Mac.
  command -v terminal-notifier >/dev/null 2>&1 && \
    terminal-notifier -title dev-ec2-instance -message "EC2 instance is now available"
  ssh "ec2-user@${hostname}"
}


emit_desktop_notification() {
  # Only supported on Mac OS X for now.
  if is_mac_os_x; then
    echo "you are on a mac"
  else
    echo "not on mac"
  fi
}



launch_instance() {
  local image_id="$1"
  local security_groups=$(find_tagged_ec2_group) || \
    errexit "Can't find tagged security group"

  local instance_id=$(aws ec2 run-instances \
    --image-id "$image_id" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$security_groups" \
    --instance-type "$INSTANCE_TYPE" \
    --iam-instance-profile "Name=$ROLE_NAME" \
    --output text \
    --query "Instances[0].InstanceId")

  # After that we tag the instance with purpose=dev-ec2-instance
  # so we can clean it up later.
  aws ec2 create-tags \
    --resources "$instance_id" \
    --tags Key=purpose,Value=dev-ec2-instance

  echo -n "Waiting for instance to be in the running state..."
  aws ec2 wait instance-running \
    --instance-ids "$instance_id"
  echo "Done"
  # Once it's done we need to do another describe call
  # to get the actual public dns name.
  local instance_hostname=$(aws ec2 describe-instances \
    --instance-ids "$instance_id" \
    --output text \
    --query Reservations[0].Instances[0].PublicDnsName)
  echo -n "Waiting for SSH port to be available at $instance_hostname..."
  wait_for_port "$instance_hostname" 22
  echo "Done"
  echo ""
  # Now actually SSH to instance
  ssh_to_instance "$instance_id" "$instance_hostname"
}


# Assumes that latest-amis is in the same directory as
# the dev-ec2-instance script, so that by adding the cwd
# to the PATH, we can invoke "latest-amis".
export PATH="$PATH:$(pwd)"
region=${AWS_DEFAULT_REGION:-$(aws configure get region)}
latest_amis=$(latest-amis -r "$region")
latest_ami=$(grep -v rc <<< "$latest_amis" | head -n 1)
# Format is: <region>\t<image_id>\t<name>\t<description>
echo "Launching: $(cut -f 4 <<< "$latest_ami" )"
launch_instance "$(cut -f 2 <<< "$latest_ami")"
