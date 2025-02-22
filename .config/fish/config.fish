if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2023-11-27 01:32:08
set PATH $PATH /Users/harry/.local/bin

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function whmlogin
    set servername $argv[1]
    ssh -t $servername "sudo whmlogin"
end

function get_public_ip
    curl -s https://api64.ipify.org
end

status --is-interactive; and rbenv init - fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

source ~/.config/fish/functions/custom_theme.fish

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# pnpm
set -gx PNPM_HOME "/Users/harry/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
