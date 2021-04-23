let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:91978891a48786fbf292fa3d14057f5354ad3feb7b972a719a48e2251090461f
  with on = On.match On.Event.FeatureBranches "no-k8s/**"
  with name = "no-k8s (branch)"
