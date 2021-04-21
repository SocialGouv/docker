let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:a696250db941f568a07a2b45106b0a63e94ddab95d4651b318a43f721a4bd53d
  with on = On.match On.Event.FeatureBranches "git-deploy/**"
  with name = "git-deploy (branch)"
