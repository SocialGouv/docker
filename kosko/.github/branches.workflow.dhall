let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:f5b667d87b37618f51a3e098e2bed278352e64bdeedb73888b8081c868183683
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
