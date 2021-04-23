let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:7f85ade27eacb00274e720e402f1a2ed6ca446c7cf5a562dbd946641b83df930
  with on = On.match On.Event.FeatureBranches "curl/**"
  with name = "curl (branch)"
