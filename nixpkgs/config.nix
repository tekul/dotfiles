{
  /* allowBroken = true; */

  packageOverrides = super: let self = super.pkgs; in
  {
    profiledHaskellPackages = self.haskellPackages.override {
      overrides = self: super: {
        mkDerivation = args: super.mkDerivation (args // {
          enableLibraryProfiling = true;
        });
      };
    };

    /* nix-env -f "<nixpkgs>" -iA myHaskellEnv
      (or -u for upgrade?)
     */
    myHaskellEnv = self.haskellPackages.ghcWithHoogle
                    (haskellPackages: with haskellPackages; [
      bytestring
      cabal-install
      xmonad
      xmonad-extras
      xmobar
    ]);
  };
}
