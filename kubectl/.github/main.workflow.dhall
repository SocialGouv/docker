let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:4d2b923336df939f145f209df40045ee09a04692a3d7044d89b9e6de3950f3b3
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
