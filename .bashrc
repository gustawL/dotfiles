# /etc/skel/.bashrc
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.
	return
fi

if test -z "${XDG_RUNTIME_DIR}"; then
        export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
        if ! test -d "${XDG_RUNTIME_DIR}"; then
                mkdir "${XDG_RUNTIME_DIR}"
                chmod 0700 "${XDG_RUNTIME_DIR}"
        fi
fi

source .config/shell/aliases
source .config/shell/variables
source .config/shell/paths

#export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
#XCURSOR_THEME=Borealis-cursors

eval "$(starship init bash)"
