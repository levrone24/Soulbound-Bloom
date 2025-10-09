#!/bin/bash

set -e

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${GREEN}🚀 Starting Hyprdots installation...${RESET}"

# 1. Install required packages
echo -e "${GREEN}📦 Installing dependencies...${RESET}"
sudo pacman -S --needed waybar swaync rofi wofi hellwal wlogout curl unzip jq imagemagick

# 2. Define config destination
CONFIG_DIR="$HOME/.config"

# 3. List of folders to move
FOLDERS=(
  ".cache/hellwal"
  "Wallpapers"
  "assets"
  "custom-theme"
  "hypr"
  "kitty"
  "rofi"
  "swaylock"
  "swaync"
  "systemd/user"
  "waybar"
  "wlogout-theme"
  "wlogout"
  "wofi"
)

echo -e "${GREEN}📁 Moving folders to ~/.config...${RESET}"
for folder in "${FOLDERS[@]}"; do
  mkdir -p "$CONFIG_DIR/$(dirname "$folder")"
  cp -r "$folder" "$CONFIG_DIR/$folder"
done

# 4. Make all .sh scripts executable
echo -e "${GREEN}🔍 Enabling all .sh scripts...${RESET}"
find "$CONFIG_DIR" -type f -name "*.sh" -exec chmod +x {} \;

# 5. Create Hellwal templates
echo -e "${GREEN}🧬 Creating Hellwal templates...${RESET}"
HELLWAL_TEMPLATES="$CONFIG_DIR/hellwal/templates"
mkdir -p "$HELLWAL_TEMPLATES"

# Create variables.sh
cat << 'EOF' > "$HELLWAL_TEMPLATES/variables.sh"
#!/bin/bash
# Add your color variables here
export PRIMARY="#ff00ff"
export SECONDARY="#00ffff"
EOF

# Create terminal.sh
cat << 'EOF' > "$HELLWAL_TEMPLATES/terminal.sh"
#!/bin/bash
# Apply terminal colors or settings here
echo "Terminal theme applied with Hellwal colors."
EOF

chmod +x "$HELLWAL_TEMPLATES/"*.sh

echo -e "${GREEN}✅ Hellwal templates created at $HELLWAL_TEMPLATES${RESET}"

# 6. Reminder for shell config
echo -e "${GREEN}📌 Add the following to your shell config (e.g. ~/.zshrc or ~/.bashrc):${RESET}"
echo -e "${GREEN}source ~/.cache/hellwal/variables.sh${RESET}"
echo -e "${GREEN}sh ~/.cache/hellwal/terminal.sh${RESET}"

echo -e "${GREEN}🎉 Hyprdots installation complete!${RESET}"
