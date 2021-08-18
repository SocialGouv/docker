let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:786f139c45c52c9264d107e50484f77981037f7d0df81a19cb1b195b4eec3920
  with on = On.match On.Event.ReleasesBranches "ci-deploy"
  with name = "ci-deploy (main)"
