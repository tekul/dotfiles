# xrdb --merge .Xresources

xmodmap ~/.Xmodmap

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets)

# See https://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
gpg-connect-agent /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# Allow us to toggle between key layouts easily depending on what
# keyboard is being used.
# Note that fcitx may also be controlling the keymap (see .config/fcitx/profile).
setxkbmap -layout us,gb -option grp:shifts_toggle

nvidia-settings --load-config-only &

urxvtd -q -f -o

fcitx

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

#exec xmonad
exec dbus-launch leftwm
