#! /bin/sh
var="notify-send Test testteitet"
for i in {1..2}
do 
	killall hyprpicker hyprshot slurp 
	sleep 0.5
	pkill hyprpicker 
	sleep 0.5
	pkill hyprshot
	sleep 0.5 
	pkill slurp
	sleep 0.5
	pkill hyprpicker 
	sleep 0.5
	killall hyprpicker
	sleep 0.5	
done
