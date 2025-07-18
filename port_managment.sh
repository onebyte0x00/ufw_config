#Adding rules from user
read -p "Enter port to allow: " port
read -p "Allow from specific IP? (leave blank for all): " ip

if [ -z "$ip" ]; then
    sudo ufw allow $port
    echo "Allowed port $port from any IP"
else
    sudo ufw allow from $ip to any port $port
    echo "Allowed port $port only from $ip"
fi

#  Bulk adding ports using arrays
declare -a ports=(80 443 22)
for port in "${ports[@]}"; do
    sudo ufw allow $port/tcp
    echo "Allowed TCP port $port"
done
