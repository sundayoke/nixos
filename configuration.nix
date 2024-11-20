# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./apps.nix
      ./nix-ld.nix
      #./lxqt.nix
      #./xfce.nix
    ];
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

# Enable NTFS at boot
  #boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "peak-nixos-002"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  ## Enable MATE Desktop environment
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.mate.enable = true;

  # Enable XFCE
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

  ## Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.wayland.enable = true;
  #services.desktopManager.plasma6.enable = true;

  #environment.plasma6.excludePackages = with pkgs; [
  #mate.mate-terminal
  #vlc
  #pkgs.libsForQt5.baloo
  #pkgs.kdePackages.elisa
  #pkgs.kdePackages.kate
  #pkgs.xterm
  #];

  ##Enable the Budgie Desktop Environment.
  #services.xserver.desktopManager.budgie.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;

  #environment.budgie.excludePackages = with pkgs; [
  #  mate.mate-terminal
  #  vlc
  #];

   ##Enable the LXQT Desktop Environment.
  #services.displayManager.sddm.wayland.enable = true;
  #services.xserver.desktopManager.lxqt.enable = true;

  #deepin
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.deepin.enable = true;

  ##Enable the Gnome Desktop Environment.
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

 #environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];
 services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
]) ++ (with pkgs.gnome; [
  cheese # webcam tool
  gnome-music
  gnome-terminal
  pkgs.gedit # text editor
  epiphany # web browser
  geary # email reader
  #evince # document viewer
  gnome-characters
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
  simple-scan
  gnome-weather
  gnome-contacts
  gnome-calculator
  pkgs.xterm
  pkgs.gnome-text-editor
]);

    # Extra Window Managers
  #services.xserver.windowManager.stumpwm.enable = true;
  #services.xserver.windowManager.ratpoison.enable = true;
  #services.xserver.windowManager.exwm.enable = true;
  ##Enable the i3 Desktop Environment.
  services.xserver.windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
        pkgs.rofi
        pkgs.networkmanagerapplet
        pkgs.pasystray
        pkgs.volumeicon
        pkgs.pa_applet
        pkgs.lxde.lxrandr
     ];
    };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "extd";
  };

  #virtualisation.docker.enable = true;
  virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
    ovmf = {
      enable = true;
      packages = [(pkgs.OVMF.override {
        secureBoot = true;
        tpmSupport = true;
      }).fd];
    };
  };
};

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "networkmanager" "wheel" "root" "sunday" "qemu-libvirtd" "libvirtd" "video" "audio" "disk" "networkmanager" ];
  environment.systemPackages = [ pkgs.vagrant ];
  systemd.user.sockets.vagrant.listenStreams = [ "8880" ];
  systemd.user.services.vagrant = {
    path = with pkgs; [ vagrant virtualbox curl ];
    script = "vagrant up --provision --no-tty --no-color";
    serviceConfig.WorkingDirectory = "/home/sunday/vagrant";
  };


  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

  # Enable Flatpak
  xdg.portal.enable = true;
  #ervices.flatpak.enable = true;

  #Enable DisplayLink Video Serice
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  services.samba.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" "root" "qemu-libvirtd" "libvirtd" "video" "audio" "disk" "networkmanager" ];
    group = "users";
    home = "/home/sunday";
    uid = 1000;
    packages = with pkgs; [
      #kdePackages.kate
      thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install Steam
  programs.steam.enable = true;

  programs.direnv.enable = true;

  #programs.nm-applet.enable = true;

  #Aliases
  programs.bash.shellAliases = {
  l = "ls -alh";
  ll = "ls -l";
  ls = "ls --color=tty";
  cls = "clear";
  CLS = "clear";
};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget


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
  fira-code
  fira
  cooper-hewitt
  ibm-plex
  jetbrains-mono
  iosevka
  # bitmap
  spleen
  fira-code-symbols
  powerline-fonts
  #nerdfonts
];

    boot.kernel.sysctl = {
    "kernel.sysrq" = 1;                       # SysRQ for is rebooting their machine properly if it freezes: SOURCE: https://oglo.dev/tutorials/sysrq/index.html
    "net.core.rmem_default" = 16777216;       # Default socket receive buffer size, improve network performance & applications that use sockets
    "net.core.rmem_max" = 16777216;           # Maximum socket receive buffer size, determin the amount of data that can be buffered in memory for network operations
    "net.core.wmem_default" = 16777216;       # Default socket send buffer size, improve network performance & applications that use sockets
    "net.core.wmem_max" = 16777216;           # Maximum socket send buffer size, determin the amount of data that can be buffered in memory for network operations
    "net.ipv4.tcp_keepalive_intvl" = 30;      # TCP keepalive interval between probes, TCP keepalive probes, which are used to detect if a connection is still alive.
    "net.ipv4.tcp_keepalive_probes" = 5;      # TCP keepalive probes, TCP keepalive probes, which are used to detect if a connection is still alive.
    "net.ipv4.tcp_keepalive_time" = 300;      # TCP keepalive interval (seconds), TCP keepalive probes, which are used to detect if a connection is still alive.
    "vm.dirty_background_bytes" = 268435456;  # 256 MB in bytes, data that has been modified in memory and needs to be written to disk
    "vm.dirty_bytes" = 1073741824;            # 1 GB in bytes, data that has been modified in memory and needs to be written to disk
    "vm.min_free_kbytes" = 65536;             # Minimum free memory for safety (in KB), can help prevent memory exhaustion situations
    "vm.swappiness" = 60;                      # how aggressively the kernel swaps data from RAM to disk. Lower values prioritize keeping data in RAM,
    "vm.vfs_cache_pressure" = 50;             # Adjust vfs_cache_pressure (0-1000), how the kernel reclaims memory used for caching filesystem objects
  };
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
