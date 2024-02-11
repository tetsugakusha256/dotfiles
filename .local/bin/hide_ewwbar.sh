#!/bin/bash

VAR_FILE="/tmp/catbar_var"

# todo add press release arg
CLIC_TYPE=$1

CATBAR=$HOME/.config/eww/catbar
show_bar() {
    eww -c $CATBAR active-windows | grep -q catbar || eww open -c $CATBAR --toggle catbar
    echo "SHOW"
}
hide_bar() {
    eww -c $CATBAR active-windows | grep -q catbar && eww open -c $CATBAR --toggle catbar
    echo "HIDE"
}

LAST_TIME_CATBAR=$(date +%s%N)
NEW_TIME_CATBAR=$(date +%s%N)
CLIC_COUNT=0
LOCK=0

if [ -f $VAR_FILE ]
then
    read -r LAST_TIME_CATBAR CLIC_COUNT LOCK < "$VAR_FILE"
    DELTA=$(( $NEW_TIME_CATBAR - $LAST_TIME_CATBAR ))

else
    touch $VAR_FILE
fi

case $CLIC_TYPE in
    "press")
        if [ $CLIC_COUNT -lt 3 ]
        then
            echo "press and less than 3: clics: " $CLIC_COUNT
            show_bar
        fi
        ;;
    "release")
      echo "delta:" $DELTA
        if [ $DELTA -lt 250000000 ]
        then
            echo "fast clic"
            CLIC_COUNT=$(( $CLIC_COUNT + 1 ))
            if [ $CLIC_COUNT -gt 3 ]
            then
                echo "more than 3"
                CLIC_COUNT=0
                if [ $LOCK -eq 0 ]
                then
                  LOCK=1
                else
                  LOCK=0
                fi
            else
                echo "less= than 3"
            fi
        else
            echo "slow clic"
            if [ $CLIC_COUNT -lt 3 -a $LOCK -eq 0 ]
            then
                echo "releass and less than 3: clics: " $CLIC_COUNT
                hide_bar
            fi
            CLIC_COUNT=0
        fi
        ;;
    *)
        ;;
esac
TIME_CATBAR=""
if [ $CLIC_TYPE = "press" ]
then
  TIME_CATBAR=$LAST_TIME_CATBAR
else
  TIME_CATBAR=$NEW_TIME_CATBAR
fi
echo "${TIME_CATBAR} ${CLIC_COUNT} ${LOCK}" > $VAR_FILE
