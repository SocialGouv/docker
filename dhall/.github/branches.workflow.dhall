let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:37b51d81867e407cb87ed6273181f1af645a67e5fdf138c0dcdbf88b56d11dbf
  with on = On.match On.Event.FeatureBranches "dhall/**"
  with name = "dhall (branch)"
