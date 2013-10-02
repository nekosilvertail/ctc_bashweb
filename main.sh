#!/bin/bash
#team-ctc.at html + bash webpage
#proudly made without php, mysql and javascript
#nekosilvertail 2013, cc-by-nc-sa

###configuration of the webpage###

title="Carinthian Multigaming Community"

insHead()
{
echo "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"
echo "<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='de' lang='de'>"
echo "<!-- minefield project A-XC13, proudly made with bash, cronjobs and html -->"
echo "<!-- (C) 2013 nekosilvertail, cc-by-sa - -->"
echo "<head>"
echo "<title>$title</title>"
echo "<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' />"
echo "<link rel='SHORTCUT ICON' href='icon.ico' type='image/x-icon'>"
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
echo "<a href='./index.html'>"
echo "div class='head'></div>"
echo "</a>"
#<!-- // Header -->

echo "<div class='sub'>"
echo "<ul id='sub-navigation'>"
#<!-- Sub-Navigation // -->
echo "<li><a href='#'>NACHRICHTEN</a></li>"
echo "<li><a href='mitglieder.html'>MITGLIEDER</a></li>"
echo "<li><a href='faq.html'>ÜBER UNS</a></li>"
echo "<li><a href='impressum.html'>IMPRESSUM</a></li>"
echo "<li><a href='kontakt.html'>KONTAKT</a></li>"
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
echo "<div align='center'><img src='http://noxish.team-ctc.at/stats/serverstats.php?plid=&serv=0&statsbox=1'></div>"
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

echo "</td>"
echo "<td>&nbsp;</td>"
echo "<td valign='top'>"
echo "<div class='panel_head'>"
#<!-- Content Panel #1 Title // -->
echo "&nbsp;.:&nbsp;Nachrichten"
#<!-- // Content Panel #1 Title -->
echo "</div>"
echo "<div class='panel_content'>"
echo "<div class='content-content'>"
#<!-- Panel #1 Content // -->

insNews

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

########################
########################
########################

main(){
	insHead
	insBody
}
main

