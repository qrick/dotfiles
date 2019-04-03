#!/bin/sh
# /etc/acpi/default.sh
# Default acpi script that takes an entry for all actions

set $*

group=${1%%/*}
action=${1#*/}
device=$2
id=$3
value=$4

log_unhandled() {
	logger "ACPI event unhandled: $*"
}

case "$group" in
	button)
		case "$action" in
			power)
				/etc/acpi/actions/powerbtn.sh
				;;

			lid)
				case "$id" in
					open)
						xset dpms force on
						;;
					close)
						xset dpms force off
						;;

					*) 
                        log_unhandled $*
                        ;;
				esac
				;;
			# if your laptop doesnt turn on/off the display via hardware
			# switch and instead just generates an acpi event, you can force
			# X to turn off the display via dpms.  note you will have to run
			# 'xhost +local:0' so root can access the X DISPLAY.
			#lid)
			#	xset dpms force off
			#	;;
			volumeup)
				/etc/acpi/actions/volume.sh up
				;;

			volumedown)
				/etc/acpi/actions/volume.sh down
				;;

			mute)
				/etc/acpi/actions/volume.sh mute
				;;

			*)	log_unhandled $* ;;
		esac
		;;

	ac_adapter)
		case "$value" in
			# Add code here to handle when the system is unplugged
			# (maybe change cpu scaling to powersave mode).  For
			# multicore systems, make sure you set powersave mode
			# for each core!
			#*0)
			#	cpufreq-set -g powersave
			#	;;

			# Add code here to handle when the system is plugged in
			# (maybe change cpu scaling to performance mode).  For
			# multicore systems, make sure you set performance mode
			# for each core!
			#*1)
			#	cpufreq-set -g performance
			#	;;

			*)	log_unhandled $* ;;
		esac
		;;

	video)
		case "$action" in
			brightnessup)
				/etc/acpi/actions/brightnessup.sh
				;;
			brightnessdown)
				/etc/acpi/actions/brightnessdown.sh
				;;
			*)	log_unhandled $* ;;
		esac
		;;
	*)	log_unhandled $* ;;
esac