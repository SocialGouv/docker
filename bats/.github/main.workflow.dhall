let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:7521e5c4e1f5300153c4bb60c274bfbbe450b7af7b1bb8be962423f84c135ce1
  with on = On.match On.Event.ReleasesBranches "bats/**"
  with name = "bats (main)"
