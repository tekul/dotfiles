if status is-interactive
    set -gx EDITOR /usr/bin/nvim
    set -gx BROWSER "firefox"
    set -gx LAUNCH_EDITOR launch_editor_script
    set -gx fish_greeting "是故滑疑之耀，聖人之所圖也"\n"shìgù huáyí zhī yào, shèngrén zhī suǒ tú yě"
    set -gx LS_COLORS "ow=31"
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk repaint
    source ~/dotfiles/aliases
    thefuck --alias | source
    ~/dotfiles/bin/check_updates &
end

