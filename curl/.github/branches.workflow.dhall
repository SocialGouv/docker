let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:adde0a8a7f87192fa32c63da7d1365128d4ba5ff81619ec4edf8c7c27268287a
  with on = On.match On.Event.FeatureBranches "curl/**"
  with name = "curl (branch)"
