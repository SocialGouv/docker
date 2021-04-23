let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:ab56a76117b2b49bc8442a793d6334b8b2640bbc082190c1ded1d1fb2c63876b
  with on = On.match On.Event.ReleasesBranches "dhall/**"
  with name = "dhall (main)"
