let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:4a85f37285027da38cb2eb54a624ada45a462a4d36a95736cee0eadd9972fa11
  with on = On.match On.Event.ReleasesBranches "nginx4spa/**"
  with name = "nginx4spa (main)"
