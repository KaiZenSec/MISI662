#Kali Linux Lab Image Reset
#Reset Empire
rm /opt/Empire/data/empire.db 
python /opt/Empire/setup/setup_database.py 
rm -rf /opt/Empire/downloads
#Reset CME
rm ~/.cme/workspaces/default/*.db
rm ~/.cme/logs/*.*
#Reset MetaSploit
msfdb reinit

#Reset Nessus
service nessusd stop
sleep 5
/opt/nessus/sbin/nessuscli fix --reset-all

#Reset FireFox
rm -r ~/.cache/mozilla/firefox/*.default/*

Clear Directories
rm -r ~/Desktop/*
rm ~/*.*

#Recreate Openvas-scripts
cat << EOF > ~/Desktop/openvas-stop.sh
\#!/bin/bash
\#Stop OpenVAS servcies.
openvas-stop
EOF

cat << EOF > ~/Desktop/openvas-start.sh
\#!/bin/bash
\#Start OpenVAS servcies.
openvas-start
echo 'Point your browser to https://127.0.0.1:9392'
EOF

#Set Responder.conf to default
sed -i 's/HTTP = Off/HTTP = On/' /etc/responder/Responder.conf
sed -i 's/SMB = Off/SMB = On/' /etc/responder/Responder.conf
sed -i 's/HTTPS = Off/HTTPS = On/' /etc/responder/Responder.conf

rm -rf /opt/impacket/
cd /opt && git clone https://github.com/SecureAuthCorp/impacket.git


#clear history
history -c
