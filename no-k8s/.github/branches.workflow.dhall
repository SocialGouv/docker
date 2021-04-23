let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:24f4950671250a07d6f123a3ef695c7a85d50d1260eec69483e9a750050443ef
  with on = On.match On.Event.FeatureBranches "no-k8s/**"
  with name = "no-k8s (branch)"
