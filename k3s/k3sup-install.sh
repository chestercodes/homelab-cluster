THE_IP=192.168.69.1

k3sup install \
  --ip=$THE_IP\
  --user=admin \
  --sudo \
  --k3s-channel=stable \
  --cluster \
  --local-path $HOME/.kube/config \
  --k3s-extra-args " --node-label nodename=bigstorage --node-ip=$THE_IP" \
  --context=homelab
