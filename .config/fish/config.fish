if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path $HOME/.bun/bin/
fish_add_path $HOME/.cargo/bin/
fish_add_path "$HOME/.deno/bin"
export GPG_TTY=$(tty)
