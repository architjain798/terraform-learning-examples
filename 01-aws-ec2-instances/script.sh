#!/bin/bash

# EC2 User Data Script for Nginx Web Server (Ubuntu)
# This script runs automatically when the instance starts

# Update package list and upgrade system
apt update -y
apt upgrade -y

# Install useful packages
apt install -y \
    git \
    curl \
    wget \
    htop \
    tree \
    unzip \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Install and configure Nginx
apt install -y nginx

# Start and enable Nginx
systemctl start nginx
systemctl enable nginx

# Create a custom welcome page with visible message
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform EC2 Instance</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 600px;
        }
        h1 {
            color: #333;
            font-size: 3em;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
        }
        .emoji {
            font-size: 4em;
            margin: 20px 0;
        }
        .message {
            font-size: 1.2em;
            color: #666;
            line-height: 1.6;
        }
        .highlight {
            background: #f0f8ff;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border-left: 5px solid #667eea;
        }
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji">🚀</div>
        <h1>SUCCESS!</h1>
        <div class="message">
            <p><strong>Your Ubuntu EC2 instance is running perfectly!</strong></p>
            <div class="highlight">
                <p>✅ Terraform deployed successfully<br>
                ✅ Ubuntu 22.04 LTS running<br>
                ✅ Nginx web server is running<br>
                ✅ User data script executed<br>
                ✅ Instance is ready to use</p>
            </div>
            <p>Instance ID: <code id="instance-id">Loading...</code></p>
            <p>Region: <code id="region">Loading...</code></p>
            <p>Timestamp: <code>${new Date().toISOString()}</code></p>
        </div>
    </div>

    <script>
        // Fetch instance metadata
        fetch('http://169.254.169.254/latest/meta-data/instance-id')
            .then(response => response.text())
            .then(data => document.getElementById('instance-id').textContent = data)
            .catch(() => document.getElementById('instance-id').textContent = 'Unable to fetch');

        fetch('http://169.254.169.254/latest/meta-data/placement/region')
            .then(response => response.text())
            .then(data => document.getElementById('region').textContent = data)
            .catch(() => document.getElementById('region').textContent = 'Unable to fetch');
    </script>
</body>
</html>
EOF

# Create a status page
cat > /var/www/html/status.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Server Status</title>
    <meta http-equiv="refresh" content="30">
</head>
<body>
    <h1>Server Status Dashboard</h1>
    <pre id="status"></pre>
    <script>
        document.getElementById('status').innerHTML =
            'Server Time: ' + new Date() + '\n' +
            'Nginx Status: Running\n' +
            'Uptime: Since instance launch\n' +
            'Auto-refresh: Every 30 seconds';
    </script>
</body>
</html>
EOF

# Install AWS CLI v2 (Ubuntu)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -rf aws awscliv2.zip

# Create a welcome message for SSH users (Ubuntu user)
cat > /home/ubuntu/welcome.txt << 'EOF'
🎉 Welcome to your Terraform-deployed Ubuntu EC2 Instance!

✅ Nginx is running and serving your website
✅ Visit your public IP in a browser to see the welcome page
✅ Status page available at: http://your-ip/status.html

Quick Commands:
- Check nginx status: sudo systemctl status nginx
- View nginx logs: sudo tail -f /var/log/nginx/access.log
- Restart nginx: sudo systemctl restart nginx

Ubuntu System Info:
- Default user: ubuntu (not ec2-user)
- Package manager: apt (not yum)
- Web root: /var/www/html

Instance configured with love by Terraform! ❤️
EOF

# Set proper ownership for ubuntu user files
chown ubuntu:ubuntu /home/ubuntu/welcome.txt

# Set proper permissions for web files
chown -R nginx:nginx /var/www/html/
chmod -R 755 /var/www/html/

# Log the completion
echo "$(date): Nginx installation and configuration completed successfully" >> /var/log/user-data.log
echo "$(date): Custom welcome page created and deployed" >> /var/log/user-data.log

# Display completion message in system log
logger "🚀 EC2 User Data Script: Nginx setup completed successfully!"
