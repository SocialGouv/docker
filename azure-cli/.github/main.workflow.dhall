let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9c9cc3356718f70e9a53509be881ba807059c76a563bfc2fd61aac6ef4d3a1ff
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
