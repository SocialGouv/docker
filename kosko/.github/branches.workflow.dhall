let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:0821d264e9c562933c509eba27d06c9b66ded81bbfe7420702f9448badd3b0ac
  with on = On.match On.Event.FeatureBranches "kosko/**"
  with name = "kosko (branch)"
