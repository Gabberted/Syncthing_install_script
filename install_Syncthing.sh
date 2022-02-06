sudo apt install apt-transport-https
curl -s https://syncthing.net/release-key.txt | gpg --dearmor | sudo tee /usr/share/keyrings/syncthing-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install syncthing
echo "Running Syncthing.. for 10 seconds. Please hold."
timeout 10s syncthing
echo "Backup default config"
mv ~/.config/syncthing/config.xml ~/.config/syncthing/config.xml.bak
echo "Fixing webhost connection authorization"
sed 's/127.0.0.1/0.0.0.0/g' ~/.config/syncthing/config.xml.bak > config.xml
sudo systemctl enable syncthing@username.service
echo "Service enabled"
sudo systemctl start syncthing@username.service
echo "Service started"






