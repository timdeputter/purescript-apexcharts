{ name = "apexcharts"
, license = "MIT"
, repository = "https://github.com/timdeputter/purescript-apexcharts.git"
, dependencies =
  [ "contravariant"
  , "effect"
  , "foreign"
  , "options"
  , "prelude"
  , "web-dom"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
