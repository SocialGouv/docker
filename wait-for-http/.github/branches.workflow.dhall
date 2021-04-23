let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:86e84604fee8a01a81a31e7a6f81abb91b2523ace5711b256f514c82aa74f5cb
  with on = On.match On.Event.FeatureBranches "wait-for-http/**"
  with name = "wait-for-http (branch)"
