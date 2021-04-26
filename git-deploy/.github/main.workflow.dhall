let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:71fe98c8368e0e8a1acf9c3326366c14ee1891c95911c7abdc19a7b640b003f6
  with on = On.match On.Event.ReleasesBranches "git-deploy/**"
  with name = "git-deploy (main)"
