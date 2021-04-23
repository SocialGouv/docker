let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:335b646f0139c48c4f11141004b66760fbf8d74226878326130250161fa96e6e
  with on = On.match On.Event.FeatureBranches "bats/**"
  with name = "bats (branch)"
