let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:a1c99525d0fa7d8e13be06076758ccc170502dec4a1600d12869040b905fc23d
  with on = On.match On.Event.ReleasesBranches "kosko/**"
  with name = "kosko (main)"
