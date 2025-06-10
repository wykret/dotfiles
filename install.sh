#!/usr/bin/env zsh

# Cores para mensagens
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Funções de mensagem
error() { echo "${RED}❌ ERRO: $1${RESET}" >&2; exit 1 }
success() { echo "${GREEN}✅ $1${RESET}" }
info() { echo "${CYAN}ℹ️ $1${RESET}" }
warning() { echo "${YELLOW}⚠️ $1${RESET}" }

# Verificar se é Arch Linux
if ! grep -q "Arch Linux" /etc/os-release 2>/dev/null; then
    warning "Este script foi feito para Arch Linux/Manjaro!"
    read -q "REPLY?Continuar mesmo assim? (y/N) " && echo || exit 1
fi

# Atualizar sistema
info "🔄 Atualizando sistema..."
sudo pacman -Syu --noconfirm || error "Falha ao atualizar sistema"

# Instalar yay (se não existir)
if ! command -v yay >/dev/null; then
    info "📦 Instalando yay..."
    sudo pacman -S --needed --noconfirm base-devel git || error "Falha ao instalar dependências"
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin || error "Falha ao clonar yay"
    cd /tmp/yay-bin && makepkg -si --noconfirm || error "Falha ao instalar yay"
    cd ~
    success "yay instalado com sucesso!"
fi

# Pacotes essenciais (modifique conforme necessário)
packages=(
    zsh python python-pip nodejs npm rustup
    neovim git wget curl unzip
    noto-fonts-emoji ttf-jetbrains-mono
    xclip xsel wl-clipboard
    python-pywal imagemagick
    floorp firefox
    kitty alacritty
    rofi waybar dunst
    ranger atool highlight
    htop btop
)

# Instalar pacotes
info "📦 Instalando pacotes principais..."
yay -S --needed --noconfirm "${packages[@]}" || error "Falha ao instalar pacotes"

# Configurar zsh como shell padrão
if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
    info "🐚 Configurando zsh como shell padrão..."
    chsh -s /usr/bin/zsh || warning "Falha ao mudar shell (execute manualmente depois)"
fi

# Instalar Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    info "✨ Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || warning "Falha ao instalar Oh My Zsh"
fi

# Instalar plugins do zsh
zsh_plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

info "🔌 Instalando plugins do zsh..."
for plugin in "${zsh_plugins[@]}"; do
    if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin" ]]; then
        git clone "https://github.com/zsh-users/$plugin" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin" || warning "Falha ao instalar $plugin"
    fi
done

# Configurar pywal
info "🎨 Configurando pywal..."
pip install --user pywal || error "Falha ao instalar pywal"
if [[ ! -d "$HOME/.config/wal" ]]; then
    mkdir -p "$HOME/.config/wal/templates"
    echo "@import \"colors.scss\";" > "$HOME/.config/wal/templates/colors.scss"
fi

# Clonar e configurar dotfiles
if [[ ! -d "$HOME/.dotfiles" ]]; then
    info "📂 Configurando dotfiles..."
    git clone "https://github.com/SEU-USUARIO/SEU-REPO-DOTFILES.git" "$HOME/.dotfiles" || error "Falha ao clonar dotfiles"
    
    # Criar links simbólicos
    ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
    ln -sf "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
    # Adicione outros arquivos conforme necessário
fi

# Instalar fontes (opcional)
info "🔠 Instalando fontes adicionais..."
yay -S --noconfirm ttf-nerd-fonts-symbols-1000-em || warning "Falha ao instalar fontes Nerd"

# Configuração final
info "🎉 Configuração quase completa!"
echo ""
echo "Para finalizar:"
echo "1. Reinicie o terminal ou execute: ${GREEN}exec zsh${RESET}"
echo "2. Configure seu tema do pywal: ${GREEN}wal -i /caminho/para/sua/imagem${RESET}"
echo "3. Reinicie suas aplicações para aplicar as configurações"

success "Instalação principal concluída!"
