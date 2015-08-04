import XMonad
import XMonad.Config.Kde
import XMonad.Util.WindowProperties (getProp32s)
import qualified XMonad.StackSet as W -- to shift and float windows
 
main = xmonad kde4Config
    { modMask = mod4Mask -- use the Windows button as mod
    , manageHook = manageHook kde4Config <+> myManageHook
    , focusedBorderColor = "#6600A3"
    }
 
myManageHook = composeAll . concat $
    [ [ className   =? c --> doFloat           | c <- myFloats]
    , [ title       =? t --> doFloat           | t <- myOtherFloats]
    , [ className   =? c --> doIgnore          | c <- myIgnores] 
    , [ title       =? t --> doIgnore          | t <- myOtherIgnores]
    ]
  where myFloats        = ["Plasma-desktop", "krunner", "plasmashell"]
        myOtherFloats   = ["alsamixer", "Firefox Preferences", "Edit Site Information", "Computers & Contacts", "Add Adblock Plus filter rule"]
        myIgnores       = []
        myOtherIgnores  = []
