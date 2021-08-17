let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:7b3bfa529dd0eafcdc5a6d4fb253c8e9f201d85ed6637b201562aa0308956ca5
  with on = On.match On.Event.ReleasesBranches "ci-deploy"
  with name = "ci-deploy (main)"
