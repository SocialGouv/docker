let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:7861ae66f1c81e6b14e56e33090d87655cd5bc47aecec99fc9b824438a343dae
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres/**"
  with name = "wait-for-postgres (main)"
