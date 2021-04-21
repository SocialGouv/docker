let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:ca1935c09c908dd0ffb6256d5011f1df227d7a9028d1c3256eba5d826ab6eee6
  with on = On.match On.Event.FeatureBranches "dhall/**"
  with name = "dhall (branch)"
