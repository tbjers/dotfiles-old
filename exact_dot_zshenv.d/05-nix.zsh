if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
elif [ -e '/home/tbjers/.nix-profile/etc/profile.d/nix.sh' ]; then
  . '/home/tbjers/.nix-profile/etc/profile.d/nix.sh';
fi
