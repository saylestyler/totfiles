# profiling programs with dtrace
sudo dtrace -c './YOUR_PROGAM large-file' -o out.stacks -n 'profile-997 /execname == "zopfli"/ { @[ustack(100)] = count(); }'

# from that dir, generate a flamegraph:
sudo ./stackcollapse.pl out.stacks | ./flamegraph.pl > pretty-graph.svg


