# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nix-ld.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

# Enable NTFS at boot
  #boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  #time.timeZone = "Europe/London";
  time.timeZone = "Europe/Malta";
  #time.timeZone = "Africa/Accra";
  #time.timeZone = "Africa/Lagos";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  ## Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.wayland.enable = true;
  #services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs; [
    mate.mate-terminal
    vlc
    pkgs.libsForQt5.baloo
    pkgs.kdePackages.elisa
    pkgs.kdePackages.kate
  ];

  ##Enable the Budgie Desktop Environment.
  #services.xserver.desktopManager.budgie.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;

  #environment.budgie.excludePackages = with pkgs; [
  #  mate.mate-terminal
  #  vlc
  #];

   ##Enable the LXQT Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.lxqt.enable = true;

   ##Enable the i3 Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.xserver.windowManager.i3.enable = true;

  ##Enable the Gnome Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  #environment.gnome.excludePackages = (with pkgs; [
  #gnome-photos
  #gnome-tour
#]) ++ (with pkgs.gnome; [
  #cheese # webcam tool
  #gnome-music
  #gnome-terminal
  #pkgs.gedit # text editor
  #epiphany # web browser
  #geary # email reader
  #evince # document viewer
  #gnome-characters
  #totem # video player
  #tali # poker game
  #iagno # go game
  #hitori # sudoku game
  #atomix # puzzle game
#]);

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "extd";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  #Enable DisplayLink Video Serice
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sunday = {
    isNormalUser = true;
    description = "Sunday Oke";
    extraGroups = [ "networkmanager" "wheel" "root" ];
    packages = with pkgs; [
      #kdePackages.kate
      #thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install Steam
  programs.steam.enable = true;

  programs.direnv.enable = true;

  #programs.nm-applet.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  	wget
    pkgs.vscode
	  pkgs.displaylink
    #pkgs.maestral
    #pkgs.maestral-gui
    pkgs.keepassxc
    #pkgs.onedrive
    #pkgs.onedrivegui
    pkgs.spotify
    pkgs.bottles
    pkgs.xfce.catfish
    pkgs.p3x-onenote
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
    pkgs.kdePackages.kdialog
    #pkgs.xfce.thunar
    #pkgs.zenity
    #pkgs.kdePackages.kdevelop
    #pkgs.discord
    #pkgs.logseq
    #pkgs.jupyter-all
    #pkgs.python312Packages.python
    #pkgs.python312Packages.pip
    #pkgs.python312Packages.virtualenv
    ## beginning of LXQT an i3 installation
    #pkgs.tk
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

  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  open-sans
];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
