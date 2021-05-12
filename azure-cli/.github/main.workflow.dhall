let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:88c48abb2ae628cd078a1e70c4d5b32a734c57e497cb70e1c08e8d932a311a15
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
