import XMonad 
import XMonad.Layout
import XMonad.StackSet as W
import XMonad.Util.Run -- spawn etc.
import XMonad.Util.EZConfig(additionalKeysP) -- Easy key bindings
import XMonad.Hooks.ManageDocks -- Manage docks, eg. XMobar, trayer
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog --Used for dzen
import XMonad.Util.Loggers --Used for dzen
import XMonad.Actions.CycleWS --Next/prev workspace switching
import XMonad.Hooks.FadeInactive 
import XMonad.Layout.Groups.Wmii as Wmii;
import XMonad.Layout.Fullscreen

manageVimb :: ManageHook
manageVimb = className =? "Vimb" --> doF W.focusDown

main = do
  trayer <- spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x882233 --height 20"
  dzen_time <- spawn "while true; do date \"+%d.%m.%Y %H:%M:%S\";sleep 1; done | dzen2 -fn 'Monaco:size=10' -xs 0 -x 1456 -y 0 -w 272 -h 20 -e 'onstart=lower'"
  dzen_main <- spawnPipe "dzen2 -fn 'Monaco:size=10' -xs 0 -w 1456 -h 20 -ta l -e 'onstart=lower'"
  xmonad $ defaultConfig { 
    -- Border can be 0, since fadeInActive is used.
      borderWidth = 0  
    , focusFollowsMouse = False
    , terminal = "lilyterm"
    -- Windows key as a modifier
    , modMask = mod4Mask
    -- See http://www.haskell.org/haskellwiki/Xmonad/Frequently_asked_questions#Make_space_for_a_panel_dock_or_tray
    , manageHook = manageVimb <+> manageDocks <+> manageHook defaultConfig
    --, layoutHook =  avoidStruts (maximize (wmii shrinkText defaultTheme)) --layoutHook defaultConfig
    , layoutHook =  avoidStruts (wmii shrinkText defaultTheme ||| fullscreenFull Full) --layoutHook defaultConfig
    , handleEventHook = docksEventHook <+> handleEventHook defaultConfig
    , logHook = fadeInactiveLogHook 0.6 >> dynamicLogWithPP dzenPP { ppOutput = hPutStrLn dzen_main }
    --, workspaces = ["1:irc", "2:www", "3:code", "4", "5", "6", "7", "8", "9", "0"]
  } `additionalKeysP` 
    [
      -- M-S-z locks screen
      ("M-S-z", spawn "gnome-screensaver-command -l")
      -- Toggle systray
      , ("M-S-t", sendMessage ToggleStruts)
      -- CycleWS (M-h/l switch desktops, M-S-h/l move windows between them)
      , ("M-<Tab>", nextWS)
      , ("M-S-<Tab>", prevWS)
      --, ("M-h", prevWS)
      --, ("M-l", nextWS)
      --, ("M-S-h", shiftToPrev)
      --, ("M-S-l", shiftToNext)
      ---WMII-like
      , ("M-h", focusGroupUp)
      , ("M-l", focusGroupDown)
      , ("M-S-h", moveToGroupUp False)
      , ("M-S-l", moveToGroupDown False)
      , ("M-j", Wmii.focusDown)
      , ("M-k", Wmii.focusUp)
      , ("M-S-j", Wmii.swapDown)
      , ("M-S-k", Wmii.swapUp)
      , ("M-<Space>", groupToNextLayout)
      , ("M-i", zoomGroupOut)
      , ("M-o", zoomGroupIn)
      , ("M-f", sendMessage NextLayout)
    ]

logfunc a b x = do  { hPutStrLn a x ; hPutStrLn b x }
