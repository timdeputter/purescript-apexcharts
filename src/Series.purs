
module Apexcharts.Series where


import Apexcharts (Apexoptions)
import Prelude (map)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Series

series :: Option Apexoptions (Array (Options Series))
series = cmap (map Opt.options) (opt "series")

name :: Option Series String
name = opt "name"

data' :: Option Series (Array Number)
data' = opt "data"

