# NixOS live ISO for air-gapped GPG key generation
# $ nixos-generate -f iso -c yubikey-image.nix
#
# to test it in a vm:
# $ nixos-generate --run -f vm -c yubikey-image.nix
{ pkgs, ... }:

let
  guide = pkgs.stdenv.mkDerivation {
    name = "yubikey-guide-2021-20-24.html";
    src = pkgs.fetchFromGitHub {
      owner = "drduh";
      repo = "YubiKey-Guide";
      rev = "fe6434577bce964aefd33d5e085d6ac0008e17ce";
      sha256 = "1f4sqj2nspv6939p3gj2ma4fnbz12l95kcr3bjzphjdgxkdx42hx";
    };
    buildInputs = [ pkgs.pandoc ];
    installPhase = ''
      pandoc --highlight-style pygments -s --toc README.md | \
        sed -e 's/<keyid>/\&lt;keyid\&gt;/g' > $out
    '';
  };
in
{
  environment.interactiveShellInit = ''
    export GNUPGHOME=/run/user/$(id -u)/gnupghome
    if [ ! -d $GNUPGHOME ]; then
      mkdir $GNUPGHOME
    fi
    cp ${pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/drduh/config/75ec3f35c6977722d4dba17732d526f704f256ff/gpg.conf";
      sha256 = "sha256-LK29P4+ZAvy9ObNGDNBGP/8+MIUY3/Uo4eJtXhwMoE0=";
    }} "$GNUPGHOME/gpg.conf"
    echo "\$GNUPGHOME has been set up for you. Generated keys will be in $GNUPGHOME."
  '';

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    yubikey-personalization
    yubikey-manager
    cryptsetup
    pwgen
    midori
    paperkey
    qrencode
    gnupg
    ctmg
  ];

  services.udev.packages = with pkgs; [ yubikey-personalization yubikey-manager ];
  services.pcscd.enable = true;

  services.printing.enable = true;
  services.printing.drivers = with pkgs; [cnijfilter2 canon-cups-ufr2];

  # make sure we are air-gapped
  networking.wireless.enable = false;
  networking.dhcpcd.enable = false;

  services.getty.helpLine = "The 'root' account has an empty password.";

  security.sudo.wheelNeedsPassword = false;
  users.users.yubikey = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = "/run/current-system/sw/bin/bash";
  };

  services.xserver = {
    enable = true;
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "yubikey";
    displayManager.defaultSession = "xfce";
    displayManager.sessionCommands = ''
      ${pkgs.midori}/bin/midori ${guide} &
      ${pkgs.xfce.terminal}/bin/xfce4-terminal &
    '';

    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
}
