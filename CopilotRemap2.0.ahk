#Requires AutoHotkey v2.0
#SingleInstance Force

repeatDelay := 400
repeatRate := 30

SendRepeating(physKey, arrowKey) {
    global repeatRate
    while GetKeyState(physKey, "P") {
        Send "{Blind}{" arrowKey "}"
        Sleep repeatRate
    }
}

*<#<+F23::{
    if (GetKeyState("LShift","P") || GetKeyState("RShift","P")) {
        Send "{LWin up}"
    } else {
        Send "{LShift up}{LWin up}"
    }
    Send "{Blind}{Left}"
    Sleep repeatDelay
    while GetKeyState("F23","P") {
        Send "{Blind}{Left}"
        Sleep repeatRate
    }
}

*RShift::{
    Send "{Blind}{Up}"
    Sleep repeatDelay
    SendRepeating("RShift","Up")
}

*Down::{
    Send "{Blind}{Right}"
    Sleep repeatDelay
    SendRepeating("Down","Right")
}

*Left::{
    Send "{Blind}{Down}"
    Sleep repeatDelay
    SendRepeating("Left","Down")
}

F12::ExitApp