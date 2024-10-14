#!/bin/bash

echo "Users with shell access:"
echo "------------------------"

while IFS=: read -r username _ uid gid _ home shell; do
    if [[ "$shell" != "/usr/sbin/nologin" && "$shell" != "/bin/false" ]]; then
        echo "Username: $username"
        echo "User ID: $uid"
        echo "Group ID: $gid"
        echo "Home Directory: $home"
        echo "Shell: $shell"
        echo "------------------------"
    fi
done < /etc/passwd
