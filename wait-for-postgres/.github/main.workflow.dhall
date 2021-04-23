let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:3b1170450362261ff0fd9de560bf265ba57e541b8e2369ccb691ca400eba4f42
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres/**"
  with name = "wait-for-postgres (main)"
