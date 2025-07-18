#!/usr/bin/env bash

echo "🐚 Instalando Makom Kodesh Terminal..."

# Backup do .zshrc antigo
if [[ -f ~/.zshrc ]]; then
  cp ~/.zshrc ~/.zshrc.bak.$(date +%s)
  echo "📦 Backup do .zshrc criado em ~/.zshrc.bak"
fi

# Copia o novo .zshrc
cp ./zshrc ~/.zshrc
echo "✅ Novo .zshrc instalado"

# Plugins
ZSH_PLUGINS_DIR="/usr/share/zsh/plugins"

# Cria diretório se necessário
sudo mkdir -p "$ZSH_PLUGINS_DIR"

# Instala plugins se não existirem
if [[ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]]; then
  echo "📦 Instalando zsh-autosuggestions..."
  sudo git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_DIR/zsh-autosuggestions"
fi

if [[ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]]; then
  echo "📦 Instalando zsh-syntax-highlighting..."
  sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
fi

# Recarrega o ZSH
echo "🔁 Recarregando shell..."
source ~/.zshrc

echo "✅ Makom Kodesh Terminal instalado com sucesso!"
