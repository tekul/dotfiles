import XMonad
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
    xmonad $ def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts $ smartBorders $ layoutHook def
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "darkgreen" "" . shorten 50
                        }
        , modMask = mod4Mask
        , terminal = "urxvtc"
        , startupHook = do
            spawnOnce emacsCmd
            spawnOnce "urxvtc"
        , focusFollowsMouse = False
        }
        `additionalKeys`
        [ ((mod4Mask, xK_b), sendMessage ToggleStruts)
        , ((mod4Mask, xK_s), spawn emacsCmd)
        , ((mod4Mask, xK_w), spawnToWorkspace "2" "firefox -new-tab about:blank")
        ]
        `additionalKeysP`
        [ ("<XF86AudioLowerVolume>", spawn "amixer set Headphone 10-")
        , ("M-<XF86AudioLowerVolume>", spawn "amixer set Headphone 3dB-")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Headphone 10+")
        , ("M-<XF86AudioRaiseVolume>", spawn "amixer set Headphone 3dB+")
        , ("<XF86AudioMute>", spawn "amixer set Master toggle")
        ]

spawnToWorkspace :: String -> String -> X ()
spawnToWorkspace workspace program = do
    spawn program
    windows $ greedyView workspace
