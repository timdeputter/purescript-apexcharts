module Test.Main where

import Prelude

import Effect (Effect)
import Test.Spec (describe, it)
import Test.Spec.Assertions (fail)
import Test.Spec.Reporter (specReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = run [specReporter] do
  describe "Chartoptions" do
    describe "chart" do
      it "type" do
        fail "lala"

