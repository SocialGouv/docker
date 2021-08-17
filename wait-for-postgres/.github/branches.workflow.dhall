let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:a3f582f7c802ca11c4f2f62eda5cf0eb36e5275bc47bfa816b5af38b99777813
  with on = On.match On.Event.FeatureBranches "wait-for-postgres"
  with name = "wait-for-postgres (branch)"
