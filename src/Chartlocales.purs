
module Apexcharts.Chart.Locales where

import Prelude (map)

import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Locales

locales :: Option Chart (Array (Options Locales))
locales = cmap (map Opt.options) (opt "locales")

name :: Option Locales String
name = opt "name"

