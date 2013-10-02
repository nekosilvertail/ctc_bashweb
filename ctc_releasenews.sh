#!/bin/bash
if [ $(whoami) != "root" ]
then
	#muss als root ausgeführt werden, ansonsten klappt das chown nicht.
	echo "Bitte als root ausführen."
	exit 0
fi
close(){
	rm $file
	exit 1
}
trap close SIGINT
file="./nachricht.tmp"
echo "Datum eingeben (XX. MONAT XXXX)"
read datum
echo "Titel eingeben" 
read titel
echo -n "$datum;$titel;" >> $file
echo "Text eingeben (Ende mit STRG+D)"
while read text
do
	echo $text >> $file
done

echo "Nachrichtenvorschau? [J/n]"
read antwort
if [ -z $antwort ]
then
	antwort=1
fi
case "$antwort" in
	[Nn]*) :;;
	*) cat $file | less;;
esac
echo "Nachricht hochladen? [j/N]"
read antwort
case "$antwort" in
	[Jj]*) chown www-data:www-data $file; scp -p -i $file user@server:/pfad/zur/datei/$(date +%Y%m%d).ctcn;;
	*) exit 0;;
esac
rm $file
