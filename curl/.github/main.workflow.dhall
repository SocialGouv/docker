let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:95646fda7c2d85bf409cd3703bb1ce4442132d3c5a60ecdb556ecae6eb9594c8
  with on = On.match On.Event.ReleasesBranches "curl/**"
  with name = "curl (main)"
