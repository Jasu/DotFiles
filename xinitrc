vmware-user-suid-wrapper &
xsetroot -cursor_name left_ptr
unclutter -idle 2 &
xrdb ~/.Xresources &
setxkbmap -option caps:escape
eval $(ssh-agent)
dunst &
~/errors.sh &
dropboxd &
compton &
xsetroot -solid '#882233'
xmonad
