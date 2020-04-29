
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


class PairedX a where
    x :: Option Paired a

instance numX :: PairedX Number where
    x = opt "x"

instance intX :: PairedX Int where
    x = opt "x"

instance strX :: PairedX String where
    x = opt "x"

class PairedY a where
    y :: Option Paired a

instance numY :: PairedY Number where
    y = opt "y"

instance intY :: PairedY Int where
    y = opt "y"

instance arrIntY :: PairedY (Array Int) where
    y = opt "y"

instance arrNumY :: PairedY (Array Number) where
    y = opt "y"


fillColor :: Option Paired String
fillColor = opt "fillColor"