echo "print info"

PW_ARGO=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
PW_GRAF=$(kubectl -n monitoring get secret cluster-prom-grafana -o jsonpath="{.data.admin-password}" | base64 -d)

echo "https://argocd.local - admin - $PW_ARGO"
echo "http://grafana.local - admin - $PW_GRAF"
echo "http://argowf.local"
echo "http://registryui.local"
echo "http://prometheus.local"
echo "http://traefik.local"

echo ""
echo "or for homelab"
echo ""

echo "https://argocd.home.arpa - admin - $PW_ARGO"
echo "http://grafana.home.arpa - admin - $PW_GRAF"
echo "http://argowf.home.arpa"
echo "http://registryui.home.arpa"
echo "http://prometheus.home.arpa"
echo "http://traefik.home.arpa"

