SUF=$(date +"%s")
sudo cp /etc/default/grub "/etc/default/grub_$SUF"

echo 'GRUB_CMDLINE_LINUX="cgroup_memory=1 cgroup_enable=memory swapaccount=1 systemd.unified_cgroup_hierarchy=0"' \
    | sudo tee -a /etc/default/grub

sudo update-grub
sudo reboot
