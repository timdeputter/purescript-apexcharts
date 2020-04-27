module Apexcharts.DataLabels.Style where
  
import Apexcharts.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Style


data FontWeight = Normal | Bold | Bolder | Lighter

fontWeightToString :: FontWeight -> String
fontWeightToString = case _ of
  Normal -> "normal"
  Bold -> "bold"
  Bolder -> "bolder"
  Lighter -> "lighter"

data FontWeightNum = N100 | N200 | N300 | N400 | N500 | N600 | N700 | N800 | N900

fontWeightNumToString :: FontWeightNum -> Int
fontWeightNumToString = case _ of
  N100 -> 100
  N200 -> 200
  N300 -> 300
  N400 -> 400
  N500 -> 500
  N600 -> 600
  N700 -> 700
  N800 -> 800
  N900 -> 900



style :: Option DataLabels (Options Style)
style =  cmap Opt.options (opt "style")

colors :: Option Style (Array String)
colors = opt "colors"  

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

class FontWeightClass a where
  fontWeight :: Option Style a

instance fontWeightString :: FontWeightClass FontWeight where
  fontWeight = opt "fontWeight"

instance fontWeightNum :: FontWeightClass Number where
  fontWeight = opt "fontWeight"


fontSize :: Option Style String
fontSize = opt "fontSize"
