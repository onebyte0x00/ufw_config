#  Check UFW status (using command substitution)
status_output=$(sudo ufw status verbose)
echo "Current firewall status:"
echo "$status_output"

#  Enable UFW with a conditional check
if ! sudo ufw status | grep -q "active"; then
    echo "Enabling UFW firewall..."
    sudo ufw enable
else
    echo "UFW is already active"
fi
