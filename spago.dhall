{ name = "apexcharts"
, dependencies =
  [ "aff"
  , "contravariant"
  , "effect"
  , "foreign"
  , "options"
  , "prelude"
  , "psci-support"
  , "spec"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
