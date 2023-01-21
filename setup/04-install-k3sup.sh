curl -sLS https://get.k3sup.dev | sh

if [ -f "k3sup-armhf" ];
then
    sudo cp k3sup-armhf /usr/local/bin/k3sup
else
    sudo cp k3sup /usr/local/bin/k3sup
fi
