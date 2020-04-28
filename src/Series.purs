
module Apexcharts.Series where


import Apexcharts (Apexoptions)
import Prelude (map)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Series
data Paired


class SeriesData a where
  data' :: Option Series (Array a)

series :: Option Apexoptions (Array (Options Series))
series = cmap (map Opt.options) (opt "series")

name :: Option Series String
name = opt "name"

instance numData :: SeriesData Number where
    data' = opt "data"
  
instance intData :: SeriesData Int where
    data' = opt "data"

instance numArrData :: SeriesData (Array Number) where
    data' = opt "data"

instance intArrData :: SeriesData (Array Int) where
    data' = opt "data"

instance numPairsData :: SeriesData (Options Paired) where
    data' = cmap (map Opt.options) (opt "data")

x :: Option Paired Number
x = opt "x"

y :: Option Paired Number
y = opt "y"