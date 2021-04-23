let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:b507d88407c4f3efeea65f71b6d0e44ba559d7ddce72228f66b1a5981df97ac7
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
