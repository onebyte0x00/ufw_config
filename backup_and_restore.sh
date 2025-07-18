#Create a backup script
backup_ufw_rules() {
    local backup_file="/etc/ufw/backup_$(date +%Y%m%d_%H%M%S).rules"
    sudo cp /etc/ufw/user.rules "$backup_file"
    echo "UFW rules backed up to $backup_file"
}

# Restore function with parameter checking
restore_ufw_rules() {
    if [ -z "$1" ] || [ ! -f "$1" ]; then
        echo "Usage: restore_ufw_rules <backup_file>"
        return 1
    fi
    sudo cp "$1" /etc/ufw/user.rules
    sudo ufw reload
    echo "UFW rules restored from $1"
}
