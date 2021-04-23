let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:a1c99525d0fa7d8e13be06076758ccc170502dec4a1600d12869040b905fc23d
  with on = On.match On.Event.ReleasesBranches "kosko/**"
  with name = "kosko (main)"
