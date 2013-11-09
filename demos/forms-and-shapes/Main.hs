{-| WIP.
    See http://helm-engine.org/guide/gradients/ -}
module Main where

import FRP.Helm
import qualified FRP.Helm.Time as Time
import qualified FRP.Helm.Window as Window

render :: Time -> (Int, Int) -> Element
render _ (w, h) = centeredCollage w h [rotate 0.5 $ filled red $ square 64]

main :: IO ()
main = do
    engine <- startup config

    run engine $ render <~ delta ~~ Window.dimensions engine

  where
    config = defaultConfig { windowTitle = "Helm - Forms and Shapes" }
    delta = Time.delay (Time.fps 60)
