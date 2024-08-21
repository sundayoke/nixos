{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano
  	wget
    pkgs.vscode
	  pkgs.displaylink
    pkgs.keepassxc
    pkgs.spotify
    pkgs.bottles
    pkgs.xfce.catfish
    pkgs.zoom-us
    pkgs.calibre
    pkgs.gimp-with-plugins
    pkgs.wpsoffice
    pkgs.libreoffice
    pkgs.google-chrome
    pkgs.vlc
    pkgs.insync
    pkgs.dialog
    pkgs.newt
    pkgs.lsof
    pkgs.samba4Full
    pkgs.libxml2
    pkgs.bc
    pkgs.cabextract
    pkgs.cryptomator
    pkgs.wineWowPackages.stagingFull
    pkgs.openvpn
    pkgs.kdePackages.partitionmanager
    pkgs.microsoft-edge
    pkgs.python312Full
    pkgs.git
    pkgs.winetricks
    pkgs.fuse3
    #pkgs.kdePackages.kdialog
    #pkgs.kdePackages.kdenlive
    pkgs.haskellPackages.libfuse3
    #pkgs.maestral
    #pkgs.maestral-gui
    #pkgs.onedrive
    #pkgs.onedrivegui
    #pkgs.xfce.thunar
    pkgs.zenity
    #pkgs.kdePackages.kdevelop
    #pkgs.discord
    #pkgs.logseq
    #pkgs.jupyter-all
    #pkgs.python312Packages.python
    #pkgs.python312Packages.pip
    #pkgs.python312Packages.virtualenv
    ## beginning of LXQT an i3 installation ##
    pkgs.tk
    #pkgs.nm-tray
    #pkgs.xfce.thunar
    #pkgs.dolphin
    #pkgs.rofi
    #pkgs.terminator
    #pkgs.konsole
    #pkgs.lxde.lxrandr
    #pkgs.i3blocks
    #pkgs.konsole
    #pkgs.feh
    #pkgs.libsForQt5.polkit-kde-agent
    #pkgs.polkit_gnome
    #pkgs.polkit
    #pkgs.libsForQt5.polkit-qt
    ];
  };

  sound.enable = true;
}
