let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:e983f0b783f2fc5367b686736b48bdd3836abb8d3f0b50e96c85195d502f1868
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
