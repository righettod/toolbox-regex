#!/bin/bash
# Sink hole all domains at the container level
grep -hIPro '(?i)https?://[a-z0-9\-.]+' * | cut -d '/' -f3 | sort -u > /tmp/hosts.txt
while IFS= read -r domain; do
  printf "%s\t%s\n" "127.0.0.1" "$domain" >> /etc/hosts
done < /tmp/hosts.txt
rm /tmp/hosts.txt
# Add a CSP to handle the browser level
sed -i 's/<\/head>/<meta http-equiv="Content-Security-Policy" content="default-src '\''self'\'' '\''unsafe-inline'\''; form-action '\''self'\''; base-uri '\''self'\''; object-src '\''none'\''; frame-ancestors '\''none'\'';"\/><\/head>/g' index.html
