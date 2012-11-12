import XMonad hiding ( (|||) )
import qualified XMonad.StackSet as W
import qualified XMonad.Layout.ToggleLayouts as TL
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig
import XMonad.Util.Run

import XMonad.Actions.SinkAll
import XMonad.Actions.Promote

import XMonad.Layout.LayoutCombinators
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.NoBorders

--
-- General
--

myTerminal         = "urxvt"
myX11Font          = "anorexia"
myWorkspaces       = ["2.7","182","818","284","590","452","353","602","874"]

--
-- Colors
--

myFGColorDark      = "#777777"
myFGColorLight     = "#CCCCCC"
myBGColorDark      = "#000000"
myBGColorLight     = "#333333"
mySelectionColor   = "#FF0000"
myBorderColor      = "#000000"
myBorderWidth      = 1

--
-- DZzen Status and Monitor Bars
--

myDzenOpts         = "  -fn '" ++ myX11Font
                  ++ "' -bg '" ++ myBGColorLight
                  ++ "' -fg '" ++ myFGColorLight
                  ++ "'"

myStatusOpts       = " -xs 1 "
                  ++ " -ta l "
                  ++ " -w 680 "

myMonitorOpts      = " -xs 1 "
                  ++ " -ta r "
                  ++ " -x 680 "
                  ++ " -w 600 "

myStatusBar        = "dzen2 "
                  ++ myDzenOpts
                  ++ myStatusOpts

myMonitorBar       = "conky -c $HOME/.conky_mon | dzen2 "
                  ++ myDzenOpts
                  ++ myMonitorOpts

--
-- Status Pretty Printer
--
myStatusPP h = dzenPP
  {   ppCurrent           = dzenColor mySelectionColor  ""
  ,   ppVisible           = dzenColor myFGColorLight    ""
  ,   ppHidden            = dzenColor myFGColorLight    ""
  ,   ppHiddenNoWindows   = dzenColor myBGColorDark     ""
  ,   ppWsSep             = " "
  ,   ppSep               = "   "
  ,   ppLayout            = wrap "^fg(#CCCCCC)<" ">^fg()"
  ,   ppTitle             = shorten 30
  ,   ppOutput            = (\x -> hPutStrLn h (" " ++ x))
  }


--
-- Dmenu Launcher
--
myDmenuOpts        = "  -sb '" ++ mySelectionColor
                  ++ "' -sf '" ++ myBGColorLight
                  ++ "' -nb '" ++ myBGColorLight
                  ++ "' -nf '" ++ myFGColorLight
                  ++ "' -fn '" ++ myX11Font
                  ++ "'"

myDmenuCmd         = "`dmenu_path | dmenu " ++ myDmenuOpts ++ "`"
myLaunchCmd        = "exe=" ++ myDmenuCmd ++ " && eval \"exec $exe\""


--
-- Key Bindings
--
myKeys =
  [ ("M-S-t", sinkAll)
  , ("M-<Return>", promote)
  , ("M-p", spawn myLaunchCmd)
  , ("M-S-b", sendMessage ToggleStruts)
  , ("M-<Space>", sendMessage TL.ToggleLayout)
  , ("M-S-<Space>", sendMessage NextLayout) ]


--
-- Main
--
main = do
  myStatusPipe <- spawnPipe myStatusBar
  myMonitorPipe <- spawnPipe myMonitorBar

  xmonad $ defaultConfig
      { terminal           = myTerminal
      , workspaces         = myWorkspaces
      , normalBorderColor  = myBorderColor
      , focusedBorderColor = myBorderColor
      , borderWidth        = myBorderWidth
      , manageHook         = myManageHook <+> manageDocks
      , layoutHook         = avoidStruts $ myLayoutHook
      , startupHook        = ewmhDesktopsStartup >> setWMName "LG3D"
      , logHook            = dynamicLogWithPP $ myStatusPP myStatusPipe
      } `additionalKeysP` myKeys


---
--- Layouts
---
myLayoutHook =
    TL.toggleLayouts (noBorders Full) $
    tiled
    ||| Grid
    ||| three
    ||| spiral (6/7)
        where
            tiled   = Tall 1 (3/100) (1/2)
            three   = ThreeCol 1 (3/100) (1/2)

---
--- Special Window Handling
---
myManageHook = composeOne
    [  className =? "MPlayer"                         -?> doFloat
    ,  className =? "Gimp"                            -?> doFloat
    ,  className =? "Firefox"                         -?> doF (W.shift "874")
    ,  className =? "google-chrome"                   -?> doF (W.shift "874")
    ,  className =? "Xfce4-notifyd"                   -?> doIgnore
    ,  className =? "Conky"                           -?> doFloat
    ,  className =? "Nautilus"                        -?> doFloat
    ,  className =? "Adl"                             -?> doFloat
    ,  className =? "Gimp-2.6"                        -?> doFloat
    ,  className =? "Vncviewer"                       -?> doFloat
    ,  className =? "Flashplayer"                     -?> doFloat
    ,  className =? "Exe"                             -?> doFloat
    ,  isFullscreen                                   -?> doFloat
    ,  title     =? "urxvtf"                          -?> doFloat
    ,  resource  =? "Adobe"                           -?> doFloat
    ,  resource  =? "desktop_widjow"                  -?> doIgnore
    ]

