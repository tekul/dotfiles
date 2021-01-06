self: super:

let
  dontCheck = super.haskell.lib.dontCheck;
  jailbreak = super.haskell.lib.doJailbreak;
in
{
  /* When using fetchFromGithub, rev is the revision to check out
     and sha256 is the nix hash of the directory (which we don't know).
     The easiest way to set it is to run with an incorrect value (e.g 0s)
     and check the error message when building to see the actual value
     (assuming the checkout worked OK).
   */
  myGhcPackageOverrides = hpkgs: _hpkgs: {
    elm-export = dontCheck (_hpkgs.callCabal2nix "elm-export" ( super.fetchFromGitHub {
      owner  = "tekul";
      repo   = "elm-export";
      sha256 = "0wb7skmf2p60gg13skvjcvd38c7069zy81b9d90xmlsa4qa454rq";
      rev = "eba32f4f881728fd98575bfa91d8bee60279641c";
    }) {});

    servant-elm = dontCheck (_hpkgs.callCabal2nix "servant-elm" ( super.fetchFromGitHub {
      owner  = "mattjbray";
      repo   = "servant-elm";
      sha256 = "1mfbd9bk5kkd6wdfhg42k0w8wccs1ffv8ndxvhsyffyswp3zwkbw";
      rev = "f665ddd5cefac26b3e56981f3516772d3987a6f3";
    }) {});

    /* servant-elm = dontCheck _hpkgs.servant-elm; */
    hasql = dontCheck _hpkgs.hasql;
    hasql-pool = dontCheck _hpkgs.hasql-pool;
    /* hakyll = dontCheck (jailbreak _hpkgs.hakyll); */
    pandoc = dontCheck _hpkgs.pandoc;
    /* pandoc-citeproc = hpkgs.callHackage "pandoc-citeproc" "0.11.1.3" {}; */
    reroute = dontCheck _hpkgs.reroute;
    binary-parser = dontCheck _hpkgs.binary-parser;
    text-builder = dontCheck _hpkgs.text-builder;
    bytestring-strict-builder = dontCheck _hpkgs.bytestring-strict-builder;
    /* postgresql-binary = dontCheck _hpkgs.postgresql-binary; */
  };

  myHaskellPackages = super.haskellPackages.override {
    overrides = self.myGhcPackageOverrides;
  };

  /* nix-env -f "<nixpkgs>" -iA haskell-env */
  haskell-env = self.myHaskellPackages.ghcWithHoogle (pset: with pset; [
    aeson
    aeson-qq
    bytestring
    cabal-install
    containers
    contravariant-extras
    criterion
    cryptonite
    data-default-generics
    doctest
    errors
    either
    hasql
    hasql-pool
    hspec
    http-conduit
    jose-jwt
    monad-logger
    pandoc
    persistent
    persistent-template
    persistent-sqlite
    postgresql-simple
    reroute
    resource-pool
    safe-exceptions
    servant-blaze
    servant-elm
    servant-server
    sqlite-simple
    tasty
    tasty-hunit
    tasty-quickcheck
    text
    transformers
    turtle
    unordered-containers
    warp
    webdriver
    xmonad
    xmonad-extras
    xmobar
    vector
  ]);
/*
  xmonad-env = self.haskell.packages.ghc861.ghcWithPackages (pset: with pset; [
    xmobar
  ]);
*/
}
