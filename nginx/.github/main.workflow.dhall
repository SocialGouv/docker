let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:a4c148b53de1f3c0ddd99a0abc75554fbd5a4ab9cea366b67d561cc3b54c51d8
  with on = On.match On.Event.ReleasesBranches "nginx"
  with name = "nginx (main)"
