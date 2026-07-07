# ==========================================
# 1. TIME-SAVING ALIASES (SHORTCUTS)
alias ll='ls -lah'              # Long list format with hidden files and sizes
alias ..='cd ..'                # Go up one directory
alias ...='cd ../..'            # Go up two directories
alias mkdir='mkdir -p'          # Create nested folders without errors
alias path='echo -e ${PATH//:/\\n}' # Print system path cleanly on new lines

# ==========================================
# 2. SAFETY GUARDS
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ==========================================
# 3. HISTORY PRESERVATION
export HISTSIZE=5000            # Remember 5,000 commands in current session
export HISTFILESIZE=10000       # Total commands to keep in storage file
export HISTCONTROL=ignoreboth   # Don't save duplicate lines or space-padded lines
shopt -s histappend             # Append to history file, don't overwrite it
