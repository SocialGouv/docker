let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:4a85f37285027da38cb2eb54a624ada45a462a4d36a95736cee0eadd9972fa11
  with on = On.match On.Event.ReleasesBranches "nginx4spa/**"
  with name = "nginx4spa (main)"
