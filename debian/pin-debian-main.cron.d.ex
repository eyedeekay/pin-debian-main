#
# Regular cron jobs for the pin-debian-main package
#
0 4	* * *	root	[ -x /usr/bin/pin-debian-main_maintenance ] && /usr/bin/pin-debian-main_maintenance
