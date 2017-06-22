import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.StackSet (greedyView)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce (spawnOnce)
import System.IO

emacsCmd = "LC_CTYPE='zh_CN.UTF-8' emacs"

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
    xmonad $ desktopConfig
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts $ smartBorders $ layoutHook def
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "darkgreen" "" . shorten 60
                        }
        , modMask = mod1Mask
        , terminal = "urxvtc"
        , startupHook = do
            spawnOnce emacsCmd
            spawnOnce "urxvtc"
        , focusFollowsMouse = False
        }
        `additionalKeys`
        [ ((mod1Mask, xK_s), spawn emacsCmd)
        , ((mod1Mask, xK_w), spawnToWorkspace "2" "firefox -new-tab about:blank")
        ]
        `additionalKeysP`
        [ ("<XF86AudioLowerVolume>", spawn "amixer set Master 10-")
        , ("M-<XF86AudioLowerVolume>", spawn "amixer set Master 3dB-")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 10+")
        , ("M-<XF86AudioRaiseVolume>", spawn "amixer set Master 3dB+")
        , ("<XF86AudioMute>", spawn "amixer set Master toggle; amixer set Speaker unmute")
        , ("<XF86MonBrightnessUp>"  , spawn "backlight -inc 10")
        , ("<XF86MonBrightnessDown>", spawn "backlight -dec 10")
        , ("M-\\", toggleTouchpad)
        ]

toggleTouchpad =
  let
    touchpad = "'SynPS/2 Synaptics TouchPad'"
    newStatus = "$(xinput --list " ++ touchpad ++ " | grep -c disabled)"
  in
    spawn $ "xinput --set-prop " ++ touchpad ++ " 'Device Enabled' " ++ newStatus

spawnToWorkspace :: String -> String -> X ()
spawnToWorkspace workspace program = do
    spawn program
    windows $ greedyView workspace
