let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:464f3713e9803a3cc3b60e8109913640ba9e23c899dabba660b5612adeb9d9b0
  with on = On.match On.Event.FeatureBranches "kubectl/**"
  with name = "kubectl (branch)"
