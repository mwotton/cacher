module Net.Cacher where

import           Database.SQLite3


data SetupError
  = NoDBFile FilePath
  | NoTargetDir FilePath
  deriving (Show)

data FetchError = FetchError
  deriving (Show)
type URL=String -- fixme

setupFetcher :: FilePath -> FilePath -> IO (Either SetupError ([String] -> IO ([FetchError], ())))
setupFetcher = undefined

-- data Fetcher
--   = Fetcher
--   { db :: Database
--   , targetDir :: FilePath
--   }

cachedFetch :: FilePath -> [String] -> IO (Either [FetchError] ())
cachedFetch = undefined

validateURLs :: [String] -> ([String], [URL])
validateURLs = undefined
