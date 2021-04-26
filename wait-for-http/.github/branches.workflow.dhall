let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:520d26a38624d22facb5575942fc587ea1f600934c42d62fb81db5c27c316874
  with on = On.match On.Event.FeatureBranches "wait-for-http/**"
  with name = "wait-for-http (branch)"
