let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:464f3713e9803a3cc3b60e8109913640ba9e23c899dabba660b5612adeb9d9b0
  with on = On.match On.Event.FeatureBranches "kubectl/**"
  with name = "kubectl (branch)"
