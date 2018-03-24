module Main where

import           Data.GI.Base.ManagedPtr
import           Foreign.ForeignPtr
import           Foreign.Ptr
import qualified GI.Gtk.Objects.Widget as GI
import           Graphics.UI.Gtk.Types
import           StatusNotifier.Tray
import           System.Glib.GObject
import           System.Taffybar

buildSNITray = do
  GI.Widget trayGIWidgetMP <- buildTrayWithHost
  wrapNewGObject mkWidget (castPtr <$> disownManagedPtr trayGIWidgetMP)

main = do
  let taffyConfig =
        defaultTaffybarConfig
        { startWidgets = []
        , endWidgets = [buildSNITray]
        }
  defaultTaffybar taffyConfig
