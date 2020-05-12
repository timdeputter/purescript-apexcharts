{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "apexcharts"
, dependencies =
  [ "aff"
  , "console"
  , "debug"
  , "decimals"
  , "effect"
  , "foldable-traversable"
  , "foreign"
  , "foreign-object"
  , "formatters"
  , "maybe"
  , "numbers"
  , "options"
  , "prelude"
  , "psci-support"
  , "quickcheck"
  , "spec"
  , "stringutils"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
