# xrdb --merge .Xresources

xmodmap ~/.Xmodmap

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# Allow us to toggle between key layouts easily depending on what
# keyboard is being used.
# Note that fcitx may also be controlling the keymap (see .config/fcitx/profile).
setxkbmap -layout us,gb -option grp:shifts_toggle

nvidia-settings --load-config-only &

fcitx

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

dunst &

dvi_name="$(xrandr | grep -Po '(DVI).+(?= connected)')"
xrandr --verbose --output "${dvi_name}" --primary

exec leftwm
