echo "create laptop cluster"

read -p "Enter laptop or homelab:" lapOrHl

echo "Read '$lapOrHl'"

if [ $lapOrHl != "laptop" ]; then
    echo "'$lapOrHl' not valid"
    exit 1
fi

# needed in config file
export BASE_DIR=$(pwd)
export HOST_DIR="$BASE_DIR/kube"

echo "Creating cluster with data dir $HOST_DIR"

k3d cluster create --config "$BASE_DIR/k3d/config.yaml"

echo "Wait a bit for cluster to be ready..."
sleep 90