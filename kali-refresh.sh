#Kali Linux Lab Image Reset
#Reset Empire
cd /opt/Empire && setup/reset.sh
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
#clear history
history -c
