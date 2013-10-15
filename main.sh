#!/bin/bash
#team-ctc.at html + bash webpage
#proudly made without php, mysql and javascript
#nekosilvertail 2013, cc-by-nc-sa

### needed for the webserver ###
echo "Content-type: text/html"
echo ""
### 

###configuration of the webpage###

title="Carinthian Multigaming Community"

genSiteTitle()
{
case $element1 in
	"news") sitetitle="Nachrichten";;
	"mitglieder") sitetitle="Mitgliederliste";;
	"ueberuns") sitetitle="Häufig gestellte Fragen";;
	"impressum") sitetitle="Impressum";;
	"kontakt") sitetitle="Kontakt";;
	*) sitetitle="Nachrichten";;
esac
}

insContent()
{
case $element1 in
	"news") insNews;;
        "mitglieder") insMitglieder;;
        "ueberuns") insUeberUns;;
        "impressum") insImpressum;;
        "kontakt") insKontakt;;
	*) insNews;;
esac
}

insHead()
{
echo "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"
echo "<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='de' lang='de'>"
echo "<!-- minefield project A-XC13, proudly made with bash, cronjobs and html -->"
echo "<!-- (C) 2013 nekosilvertail, cc-by-sa - -->"
echo "<head>"
echo "<title>$title</title>"
echo "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />"
echo "<link rel='stylesheet' href='stylesheet.css' type='text/css' media='screen' />"
echo "</head>"
}

insBody()
{
echo "<body>"
echo "<!--"
echo "Stylesheet, layout and codebase by Kitadashi // Joey Jerome Smith"
echo "( www.tsoto.net // www.tsoto-media.com )"
echo "theme and some other changes by nekosilvertail & noxis // carinthian multigaming community 2013"
echo "( www.team-ctc.at // koneko.at )"
echo "-->"

#<!-- Background Stripes 1 // -->
echo "<div class='stripes_1'></div>"
#<!-- // Background Stripes 1 -->

#<!-- Header // -->
echo "<div class='head'></div>"
#<!-- // Header -->

echo "<div class='sub'>"
echo "<ul id='sub-navigation'>"
#<!-- Sub-Navigation // -->
echo "<li><a href='?news'>NACHRICHTEN</a></li>"
echo "<li><a href='?mitglieder'>MITGLIEDER</a></li>"
echo "<li><a href='?ueberuns'>ÜBER UNS</a></li>"
echo "<li><a href='?impressum'>IMPRESSUM</a></li>"
echo "<li><a href='?kontakt'>KONTAKT</a></li>"
#<!-- // Sub-Navigation -->
echo "</ul>"
echo "</div>"

echo "<div align='center'>"
echo "<div class='content'>"
echo "<table width='100%'>"
echo "<tr>"
echo "<td valign='top' width='200'>"

#<!-- ####### -->

#<!-- Panel Nav #1 // -->
#<!-- Panel Nav #1 Title // -->
echo "<div class='panel_head'>&nbsp;.:&nbsp;Teamspeak</div>"
#<!-- // Panel Nav #1 Title -->
echo "<div class='panel_content'>"
echo "<div class='content-content'>"
#<!-- Panel Nav #1 Content // -->
echo "<p style='text-align:center'><a href='ts3server://team-ctc.at?port=9987' target='_blank'><img src='http://www.tsviewer.com/promotion/dynamic_sig/sig.php/clan160x283_varig/943910.png' alt='Carinthian Trackmania Clan TeamSpeak' title='Carinthian Trackmania Clan TeamSpeak' border='0' /></a></p>"
#<!-- // Panel Nav #1 Content -->
echo "</div>"
echo "</div>"
#<!-- // Panel Nav #1 -->

#<!-- ####### -->

#<!-- Panel Seperator/Space between Panels // -->
echo "<div class='seperator'></div>"
#<!-- // Panel Seperator/Space between Panels -->

#<!-- ####### -->

#<!-- Panel Nav #2 // -->
#<!-- Panel Nav #2 Title // -->
echo "<div class='panel_head'>&nbsp;.:&nbsp;Trackmania</div>"
#<!-- // Panel Nav #2 Title -->"
echo "<div class='panel_content'>"
echo "<div class='content-content'>"
#<!-- Panel Nav #2 Content // -->
echo "<div align='center'><img src='http://noxish.team-ctc.at/stats/serverstats.php?plid=&amp;serv=0&amp;statsbox=1' alt='tm server stats' /></div>"
#<!-- // Panel Nav #2 Content -->
echo "</div>"
echo "</div>"
#<!-- // Panel Nav #2 -->

#<!-- ####### --> 

#<!-- Panel Seperator/Space between Panels // -->
echo "<div class='seperator'></div>" 
#<!-- // Panel Seperator/Space between Panels --> 

#<!-- ####### --> 

#<!-- Panel Nav #3 // -->
#<!-- Panel Nav #3 Title // -->
echo "<div class='panel_head'>&nbsp;.:&nbsp;Shoutbox</div>"
#<!-- // Panel Nav #3 Title -->
echo "<div class='panel_content'>"
echo "<div class='content-content'>"
#<!-- Panel Nav #3 Content // -->
echo "<p style='text-align:center'><iframe name='sframe2bf1dd0d46fd2203172e248b3375b00c' src='http://ws.tsoto.net/sb/7/shouts' style='width: 180px; height: 300px; border: 0px;'></iframe><iframe src='http://ws.tsoto.net/sb/7/form' style='width: 180px; height: 80px; border: 0px;'></iframe></p>"
#<!-- // Panel Nav #3 Content -->
echo "</div>"
echo "</div>"
#<!-- // Panel Nav #3 -->

genSiteTitle

echo "</td>"
echo "<td>&nbsp;</td>"
echo "<td valign='top'>"
echo "<div class='panel_head'>"
#<!-- Content Panel #1 Title // -->
echo "&nbsp;.:&nbsp;$sitetitle"
#<!-- // Content Panel #1 Title -->
echo "</div>"
echo "<div class='panel_content'>"
echo "<div class='content-content'>"
#<!-- Panel #1 Content // -->

insContent

#<!-- // Panel #1 Content -->
echo "</div>"
echo "</div>"
echo "</td>"
echo "</tr>"
echo "<tr>"
echo "<td colspan='3'>"
echo "<div class='footer'>"
#<!-- Footer // -->
echo "&copy; Carinthian Multigaming Community $(date +%Y) // Stylesheet, layout and code base by <a href='http://www.tsoto-media.com/' target='_blank'>tsoto media</a>"
#<!-- // Footer -->
echo "</div>"
echo "</td>"
echo "</tr>"
echo "</table>"
echo "</div>"
echo "</div>"
echo "</body>"
echo "</html>"
}

insNews()
{

for i in $(ls -t news/*.ctcn)
do
	datum=$(cat $i | cut -d";" -f 1 | head -n 1) 
	newstitel=$(cat $i | cut -d";" -f 2 | head -n 1)	
	text="<p>$(cat $i| cut -d";" -f 3 | sed s/$/\<\\/p\>\<p\>/g)Lg, euer CMGC-Team</p>" 	
	#<!-- NACHRICHT -->
	echo "<h2>$datum</h2>"
	echo "<h3>$newstitel</h3>"
	echo $text
	#<!-- // NACHRICHT -->
done
}

insMitglieder()
{

	lastupdate=$(ls user/ --full-time -t --time-style=+%d.%m.%Y | head -n 2 | tail --lines 1 | awk -F ' ' '{print $6}')
	echo "<h2>Mitglieder</h2>"
	echo "<h3>der \"Carinthian Multigaming Community\"</h3>"
	echo "<p>Alle hier eingetragenen Benutzer sind offizielle Mitglieder unserer kleinen Gemeinschaft! <br />(Stand der Liste: $lastupdate)</p>"
	echo "<h4>CEO</h4>"
	echo "<p><b>Noxis</b></p>"
	echo "<br />"
	echo "<h4>CTO</h4>"
	echo "<p><b>nekosilvertail</b></p>"
	echo "<br />"
	
	echo "<h4>Technik-Abteilung</h4>"
	echo "<p><b>Leitung: nekosilvertail</b></p>"
	echo "<p><b>Teammitglieder: </b></p>"
	echo "<p><b>"
	echo "Edo-Ram64<br />"
	echo "Noxish<br />"
	echo "</b></p>"
	echo "<br />"
	
	echo "<h4>Community-Abteilung</h4>"
	echo "<p><b>Leitung: Noxis</b></p>"
	echo "<p><b>Teammitglieder: </b></p>"
	echo "<p><b>"
	echo "MuscleCar<br />"
	echo "MTX<br />"
	echo "</b></p>"
	echo "<br />"
	
	echo "<h4>Design-Abteilung</h4>"
	echo "<p><b>Leitung: MuscleCar</b></p>"
	echo "<p><b>Teammitglieder: </b></p>"
	echo "<p><b>"
	echo "nekosilvertail<br />"
	echo "noxis<br />"
	echo "</b></p>"
	echo "<br />"

	echo "<h4>Trackmania-Abteilung</h4>"
	echo "<p><b>Leitung: MTX</b></p>"
	echo "<p><b>Teammitglieder: </b></p>"
	echo "<p><b>"
	echo "Wanderknabe<br />"
	echo "hpd|Sherko<br />"
	echo "</b></p>"
	echo "<br />"

	echo "<h4>Clanmitglieder</h4>"
	echo "<p><b>"
	for i in $(ls user/*.ctcu)
	do
		echo "$(echo $i | cut -d '/' -f 2 | cut -d '.' -f 1)<br />"
	done	
	echo "</b></p>"
	usercount_r=$(ls -l user/*.ctcu | wc -l)
	usercount=$(echo $usercount_r - 1 | bc)
	echo "<p>Derzeit haben wir $usercount Mitglieder</p>"
}

insUeberUns(){
	echo "<h2>Was ist \"CMGC\"?</h2>"
	echo "<p>Die CMGC (Carinthian Multigaming Community) ist eine Vereinigung von Spielern, die sich zusammen tat, um gemeinsam und in Freundschaft die verschiedensten Videospiele zu spielen. Dabei geht es mehr um den Spaß beim spielen, als um den Sieg in forderster Front. :) </p>"
	echo "<p>Der einstige Clan unter Freunden aus Kärnten wurde 2009 gegründet und ist seit 2010 im ganzen deutschen Sprachraum vertreten: Österreich, Deutschland, Schweiz - Und dabei auch ständig gewachsen!</p>"
	echo "<p>Wir sind keiner dieser Clan's die sich auf 1 Spiel versteifen - offen für neue Spiele und mit insgesamt 3 Servern ausgestattet sind wir auch immer auf der Suche nach neuen Spielen - Und dabei ist es meist egal, in welchem Genre das Spiel unterwegs ist. Es muss nur Spaß machen! </p>"
	echo "<p>Neben der ständigen Präsenz im Teamspeak treffen sich unsere Mitglieder jedes Jahr auf der \"Sommer-LAN\", eine LAN-Party die jeden Sommer in Friesach (Kärnten, Österreich) stattfindet.</p>"
	echo "<p>Wir besitzen im Moment 3 Server, 2 davon als dedizierte Game-Server</p>"
	echo "<br />"
	echo "<h2>Darf ich mitmachen?</h2>"
	echo "<p>Natürlich! - Jeder der über 16 Jahre alt ist darf gerne mitmachen. Dazu müsst ihr euch aber bewerben. Lest vorher die <a href='www.team-ctc.at/regeln.html'>Community-Richtlinien</a> durch! ;) Und denk dran: Hier geht Freundschaft immer vor! Kein Platz für CoD-Pr0-Pwner-Kinder.</p>"
	echo "<br />"
	echo "<h2>Wo kann ich mich bewerben?</h2>"
	echo "<p>Schau doch einfach einmal auf der Kontakt-Seite nach: <a href='kontakt.html'>Kontakt</a></p>"
	echo "<br />"
	echo "<h2>Bekomme ich eine @team-ctc.at Mail-Adresse?</h2>"
	echo "<p>Es besteht durchaus die Möglichkeit als CMGC-Mitglied auch eine solche eMail zu erhalten. Vorraussetzung dafür ist eine aktive Mitarbeit in der Community, Anwesenheit, sowie das Vertrauen der Leitung des Teams. Ob eine eMail vergeben wird entscheidet das Team.</p>"
}

insImpressum(){
	echo "<p>Verantwortlich für die \"Carinthian Multigaming Community\" sind:</p>"
	echo "<p><b>Technische Leitung, Server, Website:</b><br />nekosilvertail<br />nekosilvertail[@]team-ctc[.]at</p>"
	echo "<p><b>Design, Community, Sonstiges:</b><br />Noxis<br />noxish[@]team-ctc[.]at</p>"
}

insKontakt(){
	echo "<h2>Bewerben bei \"CMGC\"</h2>"
	echo "<p>Wenn du interesse an unserer Gemeinschaft hast, kannst du dich (sofern du dein <u>16. Lebensjahr</u> vollendet hast) gerne bei uns bewerben.</p>"
	echo "<p>Dazu liest du am besten vorher schon die ><a href='http://team-ctc.at/regeln.html'>Community-Richtlinen</a> durch. Schreibe dann eine eMail mit dem Betreff "Bewerbung" an bewerbung[@]team-ctc[.]at. In dieser eMail kannst du dich unseren Administratoren vorstellen! Denk' 'dran! Der erste Eindruck ist meist der wichtigste!</p>"
	echo "<p>Melde dich eventuell auf unserem Teamspeak! (Adresse: team-ctc.at)<br /> Stell dich uns vor, erzähle uns etwas über dich und zeige uns, daß du an uns interessiert bist!</p>"
	echo "<h2>Support</h2>"
	echo "<p>Hast du ein Problem auf einem unserer Server? Gibt es etwas das du uns mitteilen willst? Willst du uns Strecken für den Trackmania-Server senden? Hast du ein technisches Problem mit einem Spiel oder deinem Ccmputer? Wir helfen gerne!</p>"
	echo "<p>Sende uns ganz einfach eine Nachricht per e-Mail an <b>support[@]team-ctc[.]at</b> oder melde dich auf unserem Teamspeak-Server!</p>"
}

########################
########################
########################

main(){
	insHead
	insBody
}
element1="$1"
main

