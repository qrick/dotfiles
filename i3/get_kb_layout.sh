function kblayout {
  case "$(xset -q|grep LED| awk '{ print $10 }')" in
    "00000000") echo "EN" ;;
    "00001001") echo "RU" ;;
  esac
}

i3status -c ~/.config/i3/i3status.conf | while :
do 
  read LINE
  echo "$LINE | $(kblayout)"
done
