module Apexcharts.Series where

import Prelude

import Apexcharts (Apexoptions)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt




data Series
data Paired

series :: Option Apexoptions (Array (Options Series))
series = cmap (map Opt.options) (opt "series")

name :: Option Series String
name = opt "name"

class SeriesData a where
    data' :: Option Series (Array a)

instance singleNumValuesSeries :: SeriesData Number where
    data' = opt "data"

instance singleIntValuesSeries :: SeriesData Int where
    data' = opt "data"

instance pairedNumValuesSeries :: SeriesData (Array Number) where
    data' = opt "data"

instance pairedIntValuesSeries :: SeriesData (Array Int) where
    data' = opt "data"

instance pairedValuesXYSeries :: SeriesData (Options Paired) where
    data' = cmap (map Opt.options) (opt "data")


class PairedX a where
  x :: Option Paired a

instance pairedXString :: PairedX String where
  x = opt "x"

instance pairedXNum :: PairedX Number where
  x = opt "x"

instance pairedXInt :: PairedX Int where
  x = opt "x"


class PairedY a where
  y :: Option Paired a

instance pairedYString :: PairedY String where
  y = opt "y"

instance pairedYNum :: PairedY Number where
  y = opt "y"

instance pairedYInt :: PairedY Int where
  y = opt "y"

