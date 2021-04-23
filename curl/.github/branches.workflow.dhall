let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:7f85ade27eacb00274e720e402f1a2ed6ca446c7cf5a562dbd946641b83df930
  with on = On.match On.Event.FeatureBranches "curl/**"
  with name = "curl (branch)"
