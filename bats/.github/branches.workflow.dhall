let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:1005f86e76255dfb8e192de3d4eb0ec76607158080fa5ca8a642872a9e34b8aa
  with on = On.match On.Event.FeatureBranches "bats/**"
  with name = "bats (branch)"
