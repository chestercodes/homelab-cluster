echo "install argocd"

CHARTS_DIR=argo-cd/charts

if [ ! -d "$CHARTS_DIR" ]; then
  echo ""$CHARTS_DIR" does not exist. run helm dep update."
  helm dep update argo-cd
fi

helm install argocd argo-cd --values ./argo-cd/values.yaml --namespace argocd

echo "Wait 75s for argo to spin up"
sleep 75

PW_ARGO=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "https://argocd.local - admin - $PW_ARGO"
