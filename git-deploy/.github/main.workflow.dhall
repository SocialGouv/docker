let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:7ce315f3f605c40aefeb934b5d2161f2c8ef876be13b5b10a0fa8b613f8219c6
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
