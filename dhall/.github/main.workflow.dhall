let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:e13b1b9e12c86dee274e8c81f680abce6474bc96417a3bcbcbebadd76d017b79
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
