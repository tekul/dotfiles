import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import System.IO

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
    xmonad $ def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts $ layoutHook def
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "darkgreen" "" . shorten 50
                        }
        , modMask = mod4Mask
        , terminal = "urxvt"
        }
        `additionalKeys`
        [ ((mod4Mask, xK_b), sendMessage ToggleStruts)
        , ((mod4Mask, xK_s), spawn "LC_CTYPE='zh_CN.UTF-8' emacs24-x")
        ]
        `additionalKeysP`
        [ ("<XF86AudioLowerVolume>", spawn "amixer set Headphone 10-")
        , ("M-<XF86AudioLowerVolume>", spawn "amixer set Headphone 3dB-")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Headphone 10+")
        , ("M-<XF86AudioRaiseVolume>", spawn "amixer set Headphone 3dB+")
        , ("<XF86AudioMute>", spawn "amixer set Master toggle")
        , ("M-\\", spawn "synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')")
        ]
