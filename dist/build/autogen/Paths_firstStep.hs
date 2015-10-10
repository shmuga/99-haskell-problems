module Paths_firstStep (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mark/Workspace/Haskell/firstStep/.cabal-sandbox/bin"
libdir     = "/home/mark/Workspace/Haskell/firstStep/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.2/firstStep-0.1.0.0-6kAjcN1xiaG47wAIWhOdbb"
datadir    = "/home/mark/Workspace/Haskell/firstStep/.cabal-sandbox/share/x86_64-linux-ghc-7.10.2/firstStep-0.1.0.0"
libexecdir = "/home/mark/Workspace/Haskell/firstStep/.cabal-sandbox/libexec"
sysconfdir = "/home/mark/Workspace/Haskell/firstStep/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "firstStep_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "firstStep_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "firstStep_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "firstStep_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "firstStep_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
