#!/bin/bash
#SSHeild: SSH Security Audit Tool

echo "SSH: Auditing SSH Configuration..."
CONFIG_FILE="/etc/ssh/sshd_config"

if grep -q "^PermitRootLogin yes" $CONFIG_FILE; then 
   echo "[WARNING] Root login is enabled. Disable it for better security."
else
   echo "[OK] Root login is disabled."
fi

if grep -q "^PasswordAuthentication yes" $CONFIG_FILE; then
   echo "[WARNING] Password authentication is enabled. Consider using key-based authentication."
else
   echo "[OK] Password authentication is disabled."
fi

if grep -q "^Protocol 1" $CONFIG_FILE; then
   echo "[WARNING] SSH Protocol 1 is outdated and insecure. Use Protocol 2."
else
   echo "[OK] Using SSH Protocol 2."
fi

echo "Audit complete. Review the above findings."
