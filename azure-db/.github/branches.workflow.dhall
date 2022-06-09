let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:d543a0f07990bc9d4822f498ced8ca32f0dc1078d0105e8b095b6a205fb78130
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
