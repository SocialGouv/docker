let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:e08daa1985232baa6b24e8c3cbe44ce586093a868f5c28ea1158cef51795a8b2
  with on = On.match On.Event.FeatureBranches "kubectl/**"
  with name = "kubectl (branch)"
