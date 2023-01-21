sudo cp /boot/cmdline.txt /boot/cmdline_old.txt
sudo sed -i "s/$/ cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory/" /boot/cmdline.txt