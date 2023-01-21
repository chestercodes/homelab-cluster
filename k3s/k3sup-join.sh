THE_IP=192.168.69.2
THE_LABEL=agent

k3sup join \
  --ip $THE_IP \
  --user admin \
  --sudo \
  --k3s-channel stable \
  --server \
  --server-ip 192.168.69.1 \
  --server-user boss \
  --sudo \
  --k3s-extra-args " --node-label nodename=$THE_LABEL --node-ip=$THE_IP"
