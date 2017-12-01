self: super:

let
  dontCheck = super.haskell.lib.dontCheck;
  jailBreak = super.haskell.lib.doJailBreak;
in
{
  haskell = super.haskell // {
    packages = super.haskell.packages // {
      ghc822 = super.haskell.packages.ghc822.extend ( hpkgs: _hpkgs: {
        elm-export = _hpkgs.callCabal2nix "elm-export" ( super.fetchFromGitHub {
          owner  = "tekul";
          repo   = "elm-export";
          rev = "91326dce9fb4e7a087e3ca7bf97c4f2022585e60";
          sha256 = "12r3mjfy4912vbn75zv9n6rj4kq08hhn78ik2v7jxjfi4i2v3fh6";
        }) {};
        hasql = dontCheck _hpkgs.hasql;
        rebase = hpkgs.callHackage "rebase" "1.1" {};
        rerebase = hpkgs.callHackage "rerebase" "1.1" {};
        servant-elm = dontCheck _hpkgs.servant-elm;
      });
    };
  };

  haskell-env = self.haskell.packages.ghc822.ghcWithHoogle (pset: with pset; [
    aeson
    bytestring
    cabal-install
    containers
    contravariant-extras
    cryptonite
    errors
    either
    hasql
    hasql-pool
    hspec
    http-conduit
    jose-jwt
    monad-logger
    safe-exceptions
    servant-elm
    servant-server
    text
    unordered-containers
    xmonad
    xmonad-extras
    xmobar
    warp
    webdriver
    vector
  ]);
}
