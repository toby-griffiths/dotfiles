#!/usr/bin/env zsh

if [ -n "$TMUX" ]
then
  exit;
fi

# Get tmux sessions and add option for a new one
TMUX_SESSIONS="$(tmux list-sessions -F "#S") \
new";
echo ${TMUX_SESSIONS}

echo "Which tmux session, or enter string for a new one";
select TMUX_SESSION in ${TMUX_SESSIONS}; do
  case $TMUX_SESSION in
    new )
      while [[ "${TMUX_SESSION}" == "new" || "${TMUX_SESSION}" == "" ]]; do
        read -p "Session name: " TMUX_SESSION
        echo "\"${TMUX_SESSION}\""
      done
      tmux new -s ${TMUX_SESSION}
      ;;
    * )
      tmux attach -t ${TMUX_SESSION}
  esac

  break
done
