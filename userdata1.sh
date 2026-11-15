
#!/bin/bash

# Update system packages
dnf update -y

# Install Apache web server
dnf install -y httpd

# Enable and start Apache
systemctl enable --now httpd

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
    <p>Vivek is here!</p>
</body>
</html>
EOF

# Restart Apache
systemctl restart httpd
