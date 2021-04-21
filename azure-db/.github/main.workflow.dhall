let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:2a50861fd2d52c3a7cacb6f307048e55386cf44008aba434d95ea43dcf644bc8
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
