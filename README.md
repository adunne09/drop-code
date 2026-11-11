# DropCode

A warm, drop-down AI coding terminal for macOS.

![DropCode](docs/dropcode.png)

DropCode embeds [`libghostty`](https://ghostty.org) and starts its terminal
session when the app launches, so your agent is ready before the panel appears.
Ghostty.app is not required.

- Tap `Control+Command` to open or close the panel. From fullscreen, each tap steps back through the normal drawer and then closed states.
- Hold `Control+Command` to show it until you release the keys.
- Press `Control+Command+Left Option` to open the panel fullscreen and fully opaque. Press it again from fullscreen to close the panel directly.
- Launch OpenCode, Codex, Claude, or any custom shell command.
- Choose a top, left, or right drawer in DropCode Settings, and adjust its height, width, and window opacity.
- Forward terminal completion requests to macOS desktop notifications.
- Keep the colors and theme configured by the launched CLI.

For OpenCode completion alerts, enable **Desktop notifications** in DropCode
and enable **Attention** in OpenCode settings. Other launchers work when they
emit standard OSC desktop-notification sequences.

## Drawer layout

Open the DropCode menu bar icon → **Settings…** → **Drawer edge** to choose
**Top**, **Left**, or **Right**. Changes apply immediately and are saved across
launches. Top is the default; side drawers start at 40% screen width and 100%
screen height. Top and side layouts remember their sizes separately. A narrower
top drawer is horizontally centered; a shorter side drawer is vertically centered.
Leaving fullscreen returns to your configured drawer edge and size.

## Download

Download a build from [GitHub Releases](https://github.com/R44VC0RP/drop-code/releases), unzip it, and move `DropCode.app` to Applications.

## Build

Requires macOS 13 or newer, Xcode, and your chosen agent CLI on `PATH`.

```sh
./scripts/build-app.sh
open .build/DropCode.app
```

Builds are ad-hoc signed by default. To use an Apple signing identity:

```sh
SIGNING_IDENTITY="Apple Development: Your Name (XXXXXXXXXX)" ./scripts/build-app.sh
```
