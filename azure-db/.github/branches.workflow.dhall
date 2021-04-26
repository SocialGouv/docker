let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:6c16322f1084637a3a382235c75eb09759efe8900ef3b6e2fe0871805a08f41d
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
