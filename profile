if [ -n "$BASH_VERSION" ]; then
        # include .bashrc if it exists
            if [ -f "$HOME/.bashrc" ]; then
                    . "$HOME/.bashrc"
                        fi
                        fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

#Generated (not stored on github)
if [ -f ~/.bash_generated ]; then
    . ~/.bash_generated
fi

if [ $XDG_CURRENT_DESKTOP="i3" ]; then
    XDG_CURRENT_DESKTOP="Unity"
fi
