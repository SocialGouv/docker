let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:7ed65713856e49114f8ae1bb52a1feb1dc3be5678333c2983402f0c2cd87f872
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
