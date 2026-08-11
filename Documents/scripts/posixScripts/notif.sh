#! /bin/sh
var="notify-send Test testteitet"
for i in {1..100}
do 
	
	nohup dunst >/dev/null 2>&1 &
	sleep 0.5
	$var
	$var
	$var
	
	sleep 2
	pkill dunst
	sleep 0.5
	
done
