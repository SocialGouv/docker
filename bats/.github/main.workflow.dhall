let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:3d4a0786b19863dc668db83cd06839f618cf557794818869d26ff51453761a33
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
