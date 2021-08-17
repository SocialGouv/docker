let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:3ed4e410413aef72d3dd6dc133882d7cd9b70fb826016125bf682a79c8d37750
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
