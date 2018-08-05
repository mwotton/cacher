{-# LANGUAGE LambdaCase #-}
module Main where

import           Control.Monad      (when)
import           Net.Cacher         (setupFetcher, validateURLs)
import           System.Environment (getArgs)
import           System.Exit        (exitFailure)

abort s = putStrLn s >> exitFailure

handleWarnings errHeader (errors,res) = do
  when (not $ null errors) $ putStrLn (unlines (errHeader:map show errors))
  pure res

handleError errHeader = either (abort . show) pure


main :: IO ()
main = do
  getArgs >>= \case
    [dbFile,urlFile, fileDir] -> handleWarnings "Fetch problems:"  =<< goFetch urlFile =<< handleError "setup problem" =<< setupFetcher dbFile fileDir
    _                         -> abort "need to pass db file and url list as arguments"

goFetch file fetcher = fetcher =<< handleWarnings "Bad urls:" . validateURLs . lines =<< readFile file
