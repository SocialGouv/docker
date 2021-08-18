let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:3f7c8eb2d1e5f07260dd6431c6ea4c2c65027f4cc78e48a8dc662b78af973b25
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
