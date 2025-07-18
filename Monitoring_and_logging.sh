#Monitor UFW logs with tail and grep
monitor_ufw_logs() {
    echo "Monitoring UFW logs (Ctrl+C to stop)..."
    sudo tail -f /var/log/ufw.log | grep --color -E 'UFW BLOCK|UFW ALLOW'
}

#Count blocked attempts by IP
analyze_blocked() {
    echo "Top blocked IP addresses:"
    sudo grep 'UFW BLOCK' /var/log/ufw.log | awk '{print $12}' | sort | uniq -c | sort -nr | head -10
}
