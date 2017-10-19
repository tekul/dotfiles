{
  packageOverrides = super: rec {
    haskell = super.haskell // {
      packages = super.haskell.packages // {
        ghc821 = super.haskell.packages.ghc821.override {
          overrides = hpkgs: _hpkgs: {
            rebase = super.haskell.lib.dontCheck(_hpkgs.rebase_1_1);
            rerebase = super.haskell.lib.dontCheck(_hpkgs.rerebase_1_1);
            elm-export = _hpkgs.callCabal2nix "elm-export" (super.fetchFromGitHub {
              owner  = "tekul";
              repo   = "elm-export";
              rev = "91326dce9fb4e7a087e3ca7bf97c4f2022585e60";
              sha256 = "12r3mjfy4912vbn75zv9n6rj4kq08hhn78ik2v7jxjfi4i2v3fh6";
            }) {};
            servant-elm = super.haskell.lib.dontCheck(_hpkgs.servant-elm);
          };
        };
      };
    };

    haskell-env = haskell.packages.ghc821.ghcWithHoogle (pset: with pset; [
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
      jose-jwt
      monad-logger
      rollbar
      safe-exceptions
      servant-elm
      servant-server
      text
      unordered-containers
      warp
      vector
    ]);

  };
}
