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
  , "web-dom"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
