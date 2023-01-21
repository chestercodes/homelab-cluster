# homelab-cluster

Helm charts for the main apps of the cluster, including the argo projects and instrumentation.

This includes scripts for setup of environment whether thats running in k3d on a laptop or running k3s on a homelab cluster.

This project was inspired by the very cool [youtube video](https://www.youtube.com/watch?v=XNXJtxkUKeY) and [repo](https://github.com/vfarcic/argo-combined-demo) but takes the ideas a bit further.


## steps to run

The steps i've been using to create and bootstrap the projects are present in the `steps` directory.

To run this properly you'll need a cloudflare domain which can be used with the cloudflare tunnel service for github webhooks and app ingress.

If you want to run this yourself you'll need to make a few changes:

- change any instance of mypersonaltld.com to your cloudflare domain, do this in this and the homelab-apps repo
- change values in the cert-manager/values.base.yaml file
- make sure to setup the cloudflare tunnel via their cli, an example can be seen in the setup/07-create-tunnel.sh file
- create a github PAT, cloudflare token and change values in steps/02.example.sh
- change any github repo paths to forked repo values i.e. https://github.com/chestercodes/homelab-cluster.git -> https://github.com/yourorg/homelab-cluster.git in this and the homelab-apps repo
- run the steps in the steps folder
- trigger builds by changing files in the following folders
- - homelab-apps/base-images/pipeline
- - homelab-apps/workflow-reporter
- - homelab-maindb/cluster
- - homelab-maindb/exporter
- - homelab-ping
- change values in homelab-apps/apps/production/manifests/production.json app to built image versions
- enjoy?


## running on homelab machines

These apps are deployed to a couple of ubuntu machines that are clustered using k3s, there are a few scripts for this in the k3s folder.

## running on laptop

I did most of the development on my laptop and had to make a few changes to enable development

### hosts file changes

To access the ingress need to add the following to `/etc/hosts`

``` bash
127.0.0.1	argocd.local grafana.local argowf.local registry.local registryui.local prometheus.local jaeger.local
```

### inotify max_user_instances

I had to increase the inotify max_user_instances on my laptop

``` bash
sudo nano /etc/sysctl.conf

# add 
# fs.inotify.max_user_instances = 512

sudo sysctl -p
```

### disabling apache2

I am running this on ubuntu and needed to stop and disable apache2

```
sudo systemctl stop apache2
sudo systemctl disable apache2
# or maybe sudo update-rc.d apache2 disable
```
