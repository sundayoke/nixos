{ config, pkgs, ... }:

let
    unstable = import <unstable> {};
in
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano
  	wget
    pkgs.notepadqq
    pkgs.vscode
	  #pkgs.displaylink
    pkgs.keepassxc
    pkgs.spotify
    #pkgs.bottles
    pkgs.xfce.catfish
    pkgs.zoom-us
    pkgs.calibre
    pkgs.gimp-with-plugins
    unstable.pkgs.libreoffice
    pkgs.google-chrome
    pkgs.vlc
    pkgs.obs-studio
    pkgs.jdk
    pkgs.insync
    pkgs.dialog
    pkgs.kdePackages.partitionmanager
    pkgs.microsoft-edge
    #unstable.pkgs.haskellPackages.trim
    pkgs.python312Full
    pkgs.git
    pkgs.libjpeg8
    pkgs.kdePackages.kalk
    pkgs.winetricks
    pkgs.isoimagewriter
    #pkgs.xfce.thunar
    #pkgs.newt
    pkgs.lsof
    pkgs.gnome.gnome-tweaks
    pkgs.gnupatch
    pkgs.libxml2
    pkgs.samba4Full
    #pkgs.libxml2pkgs.xfce.thunar
    pkgs.bc
    pkgs.cabextract
    #pkgs.wineWowPackages.stagingFull
    unstable.pkgs.wineWowPackages.stagingFull
    #pkgs.openvpn
    pkgs.fuse3
    pkgs.haskellPackages.libfuse3
    #pkgs.apt
    pkgs.brlaser
    #pkgs.appimage-run
    pkgs.kdePackages.kdialog
    pkgs.mktemp
    #pkgs.kdePackages.kdenlive
    #pkgs.maestral
    #pkgs.maestral-gui
    #pkgs.onedrive
    #pkgs.onedrivegui
    pkgs.gnome.zenity
    #pkgs.kdePackages.kdevelop
    #pkgs.discord
    #pkgs.jupyter-all
    #pkgs.python312Packages.python
    pkgs.python312Packages.pip
    #pkgs.python312Packages.virtualenv
    ## beginning of LXQT an i3 installation ##
    #pkgs.tk
    #pkgs.nm-tray
    #pkgs.dolphin
    #pkgs.rofi
    #pkgs.terminator
    #pkgs.konsole
    #pkgs.lxde.lxrandr
    #pkgs.i3blocks
    #pkgs.konsole
    pkgs.feh
    pkgs.gnome.dconf-editor
    #pkgs.libsForQt5.polkit-kde-agent
    #pkgs.polkit_gnome
    #pkgs.polkit
    #pkgs.libsForQt5.polkit-qt
    ];
    sound.enable = true;
  }


