#!/bin/bash
set -e

# Target user (adjust if needed)
USER_HOME="/home/ec2-user"

# Install nvm
su - ec2-user -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash"

# Add nvm to ec2-user bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> $USER_HOME/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $USER_HOME/.bashrc

# Install Node 20.10.0 as ec2-user
su - ec2-user -c "export NVM_DIR=\"\$HOME/.nvm\" && source \$NVM_DIR/nvm.sh && nvm install 20.10.0 && nvm alias default 20.10.0"

# Install PM2 globally
su - ec2-user -c "export NVM_DIR=\"\$HOME/.nvm\" && source \$NVM_DIR/nvm.sh && npm install -g pm2"