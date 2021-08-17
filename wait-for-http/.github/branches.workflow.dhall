let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:d06ec0a16b3ca1372e2d72df8531804b93d33d99f040ca4e2b90a0e94d22ca22
  with on = On.match On.Event.FeatureBranches "wait-for-http"
  with name = "wait-for-http (branch)"
