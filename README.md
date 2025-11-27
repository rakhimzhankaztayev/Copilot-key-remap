# Custom Arrow / Copilot / Shift Remap (AutoHotkey v2)

[Русская версия / Russian version](README.ru.md)

## Why

On my new laptop keyboard I constantly hit the Copilot key instead of the Left Arrow. Copilot pops a half‑screen panel and breaks my flow. So I remapped a few keys to restore comfortable navigation and kill accidental Copilot launches.

## What Was Remapped

| Physical Key (Original) | Now Acts As | Notes |
|-------------------------|-------------|-------|
| Copilot (Win+Shift+F23) | Left Arrow  | Becomes the only physical “Left”. |
| Right Shift             | Up Arrow    | Up is now duplicated: normal ↑ + Right Shift. |
| Down Arrow              | Right Arrow | Right is duplicated: normal → + former ↓. |
| Left Arrow              | Down Arrow  | Down moves to the old Left position. |

Resulting distribution:
- Up: original ↑ and Right Shift.
- Right: original → and former Down.
- Down: former Left.
- Left: Copilot key.
(Original Up and Right remain untouched.)

## Requirements

- Windows 10 / 11
- [AutoHotkey v2](https://www.autohotkey.com/)

## Install AutoHotkey

1. Go to [AutoHotkey](https://www.autohotkey.com/).
2. Click Download → Download v2.
3. Run installer (standard install).

## Scripts

Two variants:
1. With F12 (quick exit).
2. Without F12 (minimal).

Save one as `remap_arrows.ahk` (file extension MUST be `.ahk`).

### Variant 1 (with F12)

```ahk
#Requires AutoHotkey v2.0
#SingleInstance Force
*<#<+F23::{
    Send "{Blind}{LShift up}{LWin up}"
    Send "{Left}"
    Sleep 400
    while GetKeyState("F23","P"){
        Send "{Left}"
        Sleep 30
    }
}
*RShift::{
    Send "{Up}"
    Sleep 400
    while GetKeyState("RShift","P"){
        Send "{Up}"
        Sleep 30
    }
}
*Down::{
    Send "{Right}"
    Sleep 400
    while GetKeyState("Down","P"){
        Send "{Right}"
        Sleep 30
    }
}
*Left::{
    Send "{Down}"
    Sleep 400
    while GetKeyState("Left","P"){
        Send "{Down}"
        Sleep 30
    }
}
F12::ExitApp
```

### Variant 2 (without F12)

```ahk
#Requires AutoHotkey v2.0
#SingleInstance Force
*<#<+F23::{
    Send "{Blind}{LShift up}{LWin up}"
    Send "{Left}"
    Sleep 400
    while GetKeyState("F23","P"){
        Send "{Left}"
        Sleep 30
    }
}
*RShift::{
    Send "{Up}"
    Sleep 400
    while GetKeyState("RShift","P"){
        Send "{Up}"
        Sleep 30
    }
}
*Down::{
    Send "{Right}"
    Sleep 400
    while GetKeyState("Down","P"){
        Send "{Right}"
        Sleep 30
    }
}
*Left::{
    Send "{Down}"
    Sleep 400
    while GetKeyState("Left","P"){
        Send "{Down}"
        Sleep 30
    }
}
```

### How It Works

- Copilot key sends hardware combo Win+Shift+F23. We immediately release Win and Shift programmatically to avoid “Shift+Left” (selection) or “Win+Left” (snap window).
- First key press fires once, then after a delay (`Sleep 400`) a fast repeat loop begins (`Sleep 30` interval).
- Other remapped keys use identical repeat logic.

### Tuning

- `Sleep 400` = initial delay before repeat (feel of normal keyboard repeat start).
- `Sleep 30` = repeat speed (lower → faster; e.g. 20 or 50).

## Run

Double‑click the `.ahk` file. Green “H” icon in tray = active.

## Auto‑Start on Login

1. Press `Win + R`.
2. Type: `shell:startup` → Enter.
3. Put a shortcut to your `.ahk` file in that folder (Right‑drag → “Create shortcut here”).
4. Next login: script runs automatically.

## Tips

- If some app ignores remap: run script as Administrator.
- To reload after edits: right‑click tray icon → Reload Script.
- Variant with F12: press F12 to terminate quickly.

## Disclaimer

This only affects keyboard events while the script runs. Exit it to restore original layout. Use at your own risk (it’s safe, but unconventional).

## License

Free to use / modify / redistribute. A link back is appreciated.

Happy coding and navigation!
