#!/bin/sh

# Note taking function and command completion
n() {
  : "${NOTE_DIR:?'NOTE_DIR ENV Var not set'}"
  if [ -d "${NOTE_DIR}" ]; then
    if [ $# -eq 0 ]; then
      file=$(find "${NOTE_DIR}" -name "*.md" | \
        sed -e "s|${NOTE_DIR}/||" | \
        sed -e 's/\.md$//' | \
        fzf \
        --multi \
        --select-1 \
        --exit-0)
      [ -n $file ] && \
        ${EDITOR:-vim} "${NOTE_DIR}/${file}.md"
    else
      case "$1" in
        "-d")
          rm "${NOTE_DIR}"/"$2".md
          ;;
        "-r")
          cat "${NOTE_DIR}"/"$2".md
          ;;
        *)
          ${EDITOR:-vim} "${NOTE_DIR}"/"$*".md
          ;;
      esac
    fi
  fi
}
