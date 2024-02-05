#!/bin/bash
QUICK_CARD_PATH="$HOME/.local/bin/QuickAnki/quick_card.anki"


if [ $# -gt 1 ]; then
    echo "Usage: $0 <AnkiDeckName>"
    exit 1
fi

if pgrep -x "anki" > /dev/null; then
    echo "Anki already running."
else
    echo "Launching Anki"
    notify-send.py "Launching anki..."
    anki&
    disown
    # Waiting for it to launch, maybe should find a way to ping anki-connect
    # in a loop or something, to have something more robust
    sleep 2
fi

# Getting args
anki_deck="$1"
# If no arg, just open the quick card file on whatever it was last closed on
if [ $# -eq 0 ]; then
    # alacritty -e nvim -c ":5 | startinsert" "$QUICK_CARD_PATH"
    alacritty -e nvim -c ":Anki One Q one A" -c "startinsert" ./quick_card.anki
    # If arg given, load the template of the given deck
else
    alacritty -e nvim -c ":Anki $anki_deck" ./quick_card.anki
fi
