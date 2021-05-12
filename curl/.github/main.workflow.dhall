let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:a0193d1e4ff1de3eff0c9aa096a7c51008ef69bfdc004f70cb28ba403c7510b8
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
