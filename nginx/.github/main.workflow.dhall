let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:afa14331ec2b547d15f6caafeb1c2d50ca8ed5ed85e04a56f7afa952922c30a1
  with on = On.match On.Event.ReleasesBranches "nginx"
  with name = "nginx (main)"
