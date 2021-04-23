let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:45b3f44d025337508200b07d99ba0e34c4919a5b2ad09f363567859dd3efc892
  with on = On.match On.Event.ReleasesBranches "azure-cli/**"
  with name = "azure-cli (main)"
