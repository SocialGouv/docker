let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:c092889581d9974eef6bff25f22084b77fec9ae408d76b1d7e82bb7efbb160c7
  with on = On.match On.Event.ReleasesBranches "azure-cli/**"
  with name = "azure-cli (main)"
