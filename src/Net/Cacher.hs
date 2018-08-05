module Net.Cacher where

import           Database.SQLite3
import           Network.HTTP.Simple

data SetupError
  = NoDBFile FilePath
  | NoTargetDir FilePath
  deriving (Show)

data FetchError = FetchError
  deriving (Show)
type URL=String -- fixme

type FetchResult = ([FetchError], ())

setupFetcher :: FilePath -> FilePath -> IO (Either SetupError ([String] -> IO FetchResult))
setupFetcher = undefined

validateURLs :: [String] -> ([String], [URL])
validateURLs = undefined --  partitionEithers . map parseRequest
