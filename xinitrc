# xrdb --merge .Xresources

xmodmap ~/.Xmodmap

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh)

export SSH_AUTH_SOCK

urxvtd -q -f -o

fcitx

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

exec /usr/bin/xmonad
