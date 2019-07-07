#!/bin/bash

sendSignupsEmail() {
  ssh -i ~/.ssh/refresh.pem ubuntu@"52.6.215.69" -L 55432:"prod-db-rds.c8bhx28fstfy.us-east-1.rds.amazonaws.com":5432 -M -S ssh-socket -fN

  local user_count="$(psql -d 'host=localhost port=55432 dbname=prod user=YsZlknN4OP4sJJPh' -c $'\COPY (SELECT count(*) FROM people where created_at > now() - interval \'1 day\') TO STDOUT' |
    awk '{print "<!doctype html><html><head><style>p{font-family: Trebuchet MS;} table,th,td{border:1px solid black; padding: 5px; text-align: left; border-collapse:collapse; font-family: Trebuchet MS;}</style></head><p><strong>There were " $0 " signups today:</strong></p>";}')"

  local user_names="$(psql -d 'host=localhost port=55432 dbname=prod user=YsZlknN4OP4sJJPh' -c $'\COPY (SELECT username FROM people where created_at > now() - interval \'1 day\') TO STDOUT' |
    awk '{print "@<a href=\"https://www.vfiles.com/profile/" $1 "\">" $1 "</a>";}')"

  local vfile_count="$(psql -d 'host=localhost port=55432 dbname=prod user=YsZlknN4OP4sJJPh' -c $'\COPY (SELECT count(*) FROM vfiles where created_at > now() - interval \'1 day\') TO STDOUT' |
    awk '{print "<p><strong>There were " $0 " vfiles created today";}')"

  local media_count="$(psql -d 'host=localhost port=55432 dbname=prod user=YsZlknN4OP4sJJPh' -c $'\COPY (SELECT count(*) FROM media where created_at > now() - interval \'1 day\') TO STDOUT' |
    awk '{print "and " $0 " media uploaded:</strong></p>";}')"

  local vfiles="$(psql -d 'host=localhost port=55432 dbname=prod user=YsZlknN4OP4sJJPh' -c $'\COPY (select id, title from vfiles where created_at > now() - interval \'1 day\') TO STDOUT' |
    awk '{print "<a href=\"https://www.vfiles.com/vfiles/" $1 "\">" $2 "</a>";}')"

  local active_users="$(psql -d 'host=localhost port=55432 dbname=prod user=YsZlknN4OP4sJJPh' -c $'\COPY (select username, num_follows, num_vfiles, vfile_likes + media_likes as likes, media_uploaded from active_users where username not in (\'thomas-k\', \'JCMLDN\', \'thugsbunnny\', \'VFILESNow\', \'VFILES\', \'vbiancav\', \'julieannequay\', \'softswerve\', \'TylerSayles\', \'ChloeSnowa\', \'evan\') order by likes desc limit 50) TO STDOUT' |
    awk 'BEGIN {print "<p><strong>Active User Activity</strong><br><em>active users are calculated by the sum of these four actions all having taken place in the last month, here ordered by most things liked</em></p><table><tr> <th>username</th> <th>users followed</th> <th>vfiles created</th> <th>media liked</th> <th>media uploaded</th></tr>";} {print "<tr><td>" $1 "</td><td>" $2 "</td><td>" $3 "</td><td>" $4 "</td><td>" $5 "</td>";} END{print "</table></body></html>";}')"

  #mail -s "$(echo -e "Daily signups, vfiles, and active users\nContent-Type: text/html")" tylers@vfiles.com chloe@vfiles.com <<<"
  #$user_count
  #$user_names
  #$vfile_count
  #$media_count
  #$vfiles
  #$active_users"

  echo $vfiles

  if [ -a ssh-socket ]; then
    ssh -S ssh-socket -O exit ubuntu@"52.6.215.69"
  fi
}

sendSignupsEmail
