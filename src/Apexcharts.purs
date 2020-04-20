module Apexcharts where

import Prelude

import Effect (Effect)
import Data.Options (Option, Options, opt, options)
import Foreign (Foreign)

data Chartoptions

foreign import data Chart :: Type

chart :: Option Chartoptions String
chart = opt "chart"

test :: Option Chartoptions String
test = opt "test"


createChart :: String -> Options Chartoptions -> Chart
createChart name opts = _createChart name (options opts)

foreign import _createChart :: String -> Foreign -> Chart

foreign import render :: Chart -> Effect Unit

foreign import _updateOptions :: Chart -> Foreign -> Effect Unit