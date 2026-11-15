
#!/bin/bash

# Update system packages
apt-get update -y

# Install Apache
apt-get install -y apache2

# Start Apache and enable it on boot
systemctl enable --now apache2

# Create a custom HTML webpage
cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform EC2 Project</title>
</head>
<body>
    <h1>Hello from AWS EC2!</h1>
    <h2>Website deployed using Terraform</h2>
    <p>Apache was installed automatically using userdata.sh</p>
</body>
</html>
EOF

# Restart Apache
systemctl restart apache2
