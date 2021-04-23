let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:e4f5322d03ca48403e1400dacfe8ab769bed16f2e70a87c68f387d60ea1bef3c
  with on = On.match On.Event.FeatureBranches "git-deploy/**"
  with name = "git-deploy (branch)"
