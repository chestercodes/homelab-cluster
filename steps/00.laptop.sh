echo "create laptop cluster"

read -p "Enter laptop or homelab:" lapOrHl

echo "Read '$lapOrHl'"

if [ $lapOrHl != "laptop" ]; then
    echo "'$lapOrHl' not valid"
    exit 1
fi

export BASE_DIR=$(pwd)
export HOST_DIR="$BASE_DIR/kube"

echo "Creating cluster with data dir $HOST_DIR"

sudo mkdir -p     "$HOST_DIR"
sudo mkdir -p     "$HOST_DIR/agents"
sudo mkdir -p     "$HOST_DIR/agents/bigstorage"
sudo mkdir -p     "$HOST_DIR/agents/bigstorage/maindb-production"
sudo mkdir -p     "$HOST_DIR/agents/bigstorage/registry"
sudo mkdir -p     "$HOST_DIR/agents/bigstorage/maindb-staging"
sudo chmod -R 777 "$HOST_DIR"
