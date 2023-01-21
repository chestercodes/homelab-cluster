echo "add apps"

read -p "Enter laptop or homelab:" lapOrHl

echo "Read '$lapOrHl'"

if [ $lapOrHl != "laptop" ] && [ $lapOrHl != "homelab" ]; then
    echo "'$lapOrHl' not valid"
    exit 1
fi

kubectl apply -f projects.yaml

echo "Wait 5s for projects"
sleep 5

kubectl apply -f cluster.$lapOrHl.yaml
