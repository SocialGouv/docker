let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:464d15b2c329fa33aa25acd9a43004c397f79b8c6a75bcd0c57a66111edfc601
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
