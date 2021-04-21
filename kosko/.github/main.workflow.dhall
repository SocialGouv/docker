let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:272860140b69c4c17b7b2e8a9b0d61b0214f8169e52e1d6c4dfda8e63a4267cb
  with on = On.match On.Event.ReleasesBranches "kosko/**"
  with name = "kosko (main)"
