let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:655e676f622507fca1c4d0e7d3fc990ff4756868189039bdf701082ee0699090
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
