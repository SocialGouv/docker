let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:8fbb1ee737332f001b7ebef95b2295629d75aa1d9e059388302841f94c638cf1
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
