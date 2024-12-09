{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "host";
  networking.networkmanager.enable = true;  # Network

  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound
  # hardware.pulseaudio.enable = true;
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  services.libinput.enable = true; # Enable touchpad support

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  boot.supportedFilesystems = [ "ntfs" ];

   users.users.muhit = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       alacritty
       fastfetch
       librewolf
       syncthing
       keepassxc
       pulsemixer
       code-cursor
       git
       vim
       # Files & Media
       xfce.thunar
       polkit_gnome
       papirus-icon-theme
       xfce.thunar-volman
       ffmpegthumbnailer
       blueman
       gvfs
       mpv
       qview
       unzip
       ntfs3g
       # Hyprland
       hyprlock
       cliphist
       wl-clipboard
       waybar
       wofi
       swww
     ];
   };

  fonts.packages = with pkgs; [
     noto-fonts
     noto-fonts-color-emoji
  ];

  programs.hyprland.enable = true;
  xdg.portal.enable = true;
  security.polkit.enable = true;
  system.stateVersion = "24.11"; # Did you read the comment?
}
