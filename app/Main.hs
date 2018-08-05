{-# LANGUAGE LambdaCase #-}
module Main where

import           Net.Cacher         (cachedFetch)
import           System.Environment (getArgs)
import           System.Exit        (exitFailure)

main :: IO ()
main = do
  getArgs >>= \case
    [dbFile,urlFile] -> error "not yet"
    _ -> putStrLn "need to pass db file and url list as arguments" >> exitFailure
