let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:24f4950671250a07d6f123a3ef695c7a85d50d1260eec69483e9a750050443ef
  with on = On.match On.Event.FeatureBranches "no-k8s/**"
  with name = "no-k8s (branch)"
