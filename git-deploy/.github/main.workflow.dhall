let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:7652c5681e03855a3df3fdab737e0cee421c61d30301a296dfa412d1d654dc61
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
