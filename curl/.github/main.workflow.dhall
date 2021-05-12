let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:add25cb0126effc17fd57bbb6c9e7e396378a871a25117d67422e66d2ff3b983
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
