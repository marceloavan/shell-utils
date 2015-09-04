while sleep .5 && ((SECONDS <= 60)); do      printf '\r%s: %2d' "One moment please" "^C(60-SECONDS))"; done


hourglass(){ trap 'tput cnorm' 0 1 2 15 RETURN;local s=$(($SECONDS +$1));(tput civis;while (($SECONDS<$s));do for f in '|' '\' '-' '/';do echo -n "$f";sleep .2s;echo -n $'\b';done;done;);}

