let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:4733a335505d4b15df36bc0a5edb9e800e364bbfe28d0ebae3706039896cc330
  with on = On.match On.Event.FeatureBranches "curl/**"
  with name = "curl (branch)"
