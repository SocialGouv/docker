let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:f6f5153e8a119af43279a763563681931cee041169bf64333b97c6559eea01a8
  with on = On.match On.Event.FeatureBranches "no-k8s/**"
  with name = "no-k8s (branch)"
