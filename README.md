# i3-config-ansible

install an i3-wm (from repo) include and all other useful things ;)

- [Requirements](#requirements)
- [Styles](#styles)
- [Monitor Resolution & Config](#monitor-resolution--config)
- [Config Playbook](#config-playbook)
- [Run Playbook](#runplaybook)
- [Keybindings](#keybindings)
- [Thanks](#thanks)

<a name="requirements"></a>
##### Requirements

first you have to download & install an Ubuntu 20.04 from here : https://releases.ubuntu.com/20.04/

then install the openssh-server on your ubuntu. 
```bash
sudo apt install openssh-server
```
configure key for ssh connection : https://www.ssh.com/ssh/keygen/

<a name="styles"></a>
##### Styles

there are two types available installation with i3blocks or polybar

**you have to choose this before you run the playbook the first time**

group_vars/all.yml -> set install_polybar to true if you want the polybar

there are diffrent style and configurations available : https://github.com/adi1090x/polybar-themes

*Polybar*
![alt text]( "Polybar with Templat hack")

*i3blocks*
![alt text]( "my i3blocks config i used for years ;-)")

*tools*
![alt text]( "styled applications")

<a name="#monitor-resolution--config"></a>
##### Monitor Resolution & Config
get the resolution and the name from the primary screen with xrandr first ! (client not host)
the output look similar to this

```bash
Screen 0: minimum 8 x 8, current 1920 x 1080, maximum 32767 x 32767
HDMI-0 disconnected (normal left inverted right x axis y axis)
DP-0 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
eDP-1-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm x 194mm
   1920x1080    120.02*+  60.01    59.97    59.96    59.93  
   1680x1050     84.94    74.89    69.88    59.95    59.88  
   1600x1024     60.17  
   1400x1050     85.00    74.76    70.00    59.98  
...
DP-1-1 disconnected (normal left inverted right x axis y axis)
HDMI-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 disconnected (normal left inverted right x axis y axis)
HDMI-1-2 disconnected (normal left inverted right x axis y axis)
HDMI-1-3 disconnected (normal left inverted right x axis y axis)
```

<a name="config-playbook"></a>
##### Config Playbook

now choose your primary screen und set in group_vars/all.yml
configure it in group_vars/all.yml
```yaml
# Configure Your Primary Screen HERE ! otherwise the systray will not work !
i3_screen_output: eDP-1-1
i3_screen_resolution: 1920x1080
```
here you can set more variable 
for example if you want to install powerline then set install_powerline: to **true** if not set to **false** 
same with all other vars 
```yaml
# install powerline if you want set to false if not
install_powerline: true
# install i3 gaps
install_i3_gaps: true
# install wallpapers
install_wallpaper: false
# install nerdfonts
install_nerdfonts: false
```
create a hosts.ini and configure the target machine
```bash
[ubuntu_clients]
ubuntucl01 ansible_host=IP-OF-TARGET-MACHINE ansible_connection=ssh ansible_user=USER-ON-TARGET-MACHINE-WITH-SUDO-RIGHTS
```
for example :
```bash
[ubuntu_clients]
vm-test-01 ansible_host=10.0.0.16 ansible_connection=ssh ansible_user=ansible
```
<a name="runplaybook"></a>
##### RunPlaybook

run the playbook
```bash
ansible-playbook -i hosts.ini run.yml --extra-vars "ansible_ssh_pass=YOURPASSWORDHERE ansible_sudo_pass=YOURPASSWORDHERE"
```
<a name="keybindings"></a>
##### Keybindings

normaly i use the default keybindings from i3-wm 
check : https://i3wm.org/docs/userguide.html#_default_keybindings

my special keybindings are:

| Keybinding                  | Function                     |
| --------------------------- | -------------------------- |
| <kbd>super</kbd> + <kbd>home</kbp> | show menu in i3block for shutdown logon ... |
| <kbd>super</kbd> + <kbd>Ctrl</kbd> + <kbd>c</kbd> | run gnome control center |
| <kbd>super</kbd> + <kbd>l</kbd> | lock screen |
| <kbd>super</kbd> + <kbd>-</kbd> | decrease i3gaps width between |
| <kbd>super</kbd> + <kbd>+</kbd> | increase i3gaps width between |

you can run a grep command on the final file (client not host) to see all keybindigs :-)
```bash
grep bindsym ~/.config/i3/config
```
<a name="thanks"></a>
##### Thanks

Tanks to the following repos :-)

* https://github.com/PRATAP-KUMAR/focalgdm3
* https://gist.github.com/85942af486eb79118467.git
* https://www.github.com/Airblader/i3
* https://github.com/ryanoasis/nerd-fonts.git
* https://github.com/vinceliuice/Qogir-icon-theme
* https://github.com/powerline/fonts.git
* https://github.com/sauvaget/i3-gnome.git
* https://github.com/wfxr/tmux-power
