#!/usr/bin/env bash

# Cores
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

# Funções de mensagem
error() { echo -e "${RED}❌ ERRO: $1${NC}" >&2; exit 1; }
success() { echo -e "${GREEN}✅ $1${NC}"; }
info() { echo -e "${CYAN}ℹ️ $1${NC}"; }
warning() { echo -e "${YELLOW}⚠️ $1${NC}"; }

# --- Passo 1: Instalar yay (binário) ---
install_yay() {
    if ! command -v yay &> /dev/null; then
        info "Instalando yay (binário)..."
        sudo pacman -S --needed --noconfirm git base-devel || error "Falha nas dependências"
        git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin || error "Falha ao clonar yay-bin"
        cd /tmp/yay-bin && makepkg -si --noconfirm || error "Falha ao instalar yay-bin"
        cd ~
        success "yay-bin instalado!"
    fi
}

# --- Passo 2: Instalar pacotes (priorizando binários) ---
install_packages() {
    info "Instalando pacotes principais (binários preferenciais)..."
    
    # Pacotes oficiais (pacman)
    official_pkgs=(
        zsh git neovim kitty hyprland waybar rofi
        python-pywal wl-clipboard noto-fonts-emoji
        ttf-jetbrains-mono xdg-desktop-portal-hyprland
    )
    
    # Pacotes AUR (binários)
    aur_pkgs=(
        floorp-bin swaylock-effects-git
    )

    sudo pacman -Syu --noconfirm || warning "Falha ao atualizar sistema"
    sudo pacman -S --needed --noconfirm "${official_pkgs[@]}" || error "Falha ao instalar pacotes oficiais"
    
    # Instala pacotes AUR como binários
    for pkg in "${aur_pkgs[@]}"; do
        yay -S --needed --noconfirm "$pkg" || warning "Falha ao instalar $pkg"
    done
}

# --- Passo 3: Copiar configurações do Hyprland ---
copy_hypr_config() {
    local src="$DOTFILES_DIR/.config/hypr"
    local dest="$HOME/.config/hypr"
    
    if [ -d "$src" ]; then
        info "Copiando configurações do Hyprland..."
        mkdir -p "$HOME/.config"
        cp -r "$src" "$dest" && success "Hyprland configurado!" || warning "Falha ao copiar hypr/"
    else
        warning "Configurações do Hyprland não encontradas em $src"
    fi
}

# --- Passo 4: Configurar ambiente ---
setup_environment() {
    # Zsh como shell padrão
    [[ "$SHELL" != */zsh ]] && chsh -s "$(which zsh)"
    
    # Oh My Zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        info "Instalando Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
}

# --- Execução principal ---
main() {
    install_yay
    install_packages
    copy_hypr_config
    setup_environment
    
    echo -e "\n${GREEN}✅ Instalação concluída!${NC}"
    echo -e "Execute ${CYAN}exec zsh${NC} e depois:"
    echo -e "Para aplicar temas: ${CYAN}wal -i ~/imagens/seu-wallpaper.jpg${NC}\n"
}

# Variáveis globais
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
main "$@"
