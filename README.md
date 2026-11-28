# Strawberry Where Winds Meet Planner

A browser-based strategy planner for **Where Winds Meet**. It runs as a static website; it does not need a backend or build step.

## Features

- Image and video map editors with separate backgrounds.
- Import a map image or add a video file from your device as the map background.
- Play and edit a device video in the dedicated video editor, with seek, skip, volume, speed, and opacity controls.
- Scan labeled player screenshots for names, roles, weapons, and optional team numbers, then review the results.
- Choose a planner wallpaper and tune its dimming from **Manage → Wallpaper**.
- High contrast dark theme controls for placing players and map objectives.
- Place players and markers, draw and annotate plans, and export strategies.
- Store planner data in the current browser. No account is required.

## Publish on GitHub Pages

1. Open this folder in GitHub Desktop with **File → Add local repository**: `Strawberry_WhereWindsMeet_Planner_GitHub`.
2. Commit the listed project files to `main`, then choose **Publish repository** and set it to **Public**.
3. In the new GitHub repository, open **Settings → Pages** and select **Deploy from a branch**, then choose **main** and **/(root)**.
4. GitHub Pages builds the static site from the root of `main`. Future commits to `main` publish automatically. The site URL appears under **Settings → Pages**.

If you prefer the GitHub website, create an empty public repository, then add this folder as the local repository in GitHub Desktop and set that new repository as its remote before pushing `main`.

The entry page is `index.html`, so no URL rewrite or application server is needed on GitHub Pages.

## Run locally on Windows

Double-click `Start_Planner_Locally.cmd` and keep the opened PowerShell window running. It opens the planner at `http://127.0.0.1:8765/`.

## Video and browser storage notes

- Video files are imported from the device. Common browser supported formats include MP4 (H.264/AAC) and WebM; support varies by browser.
- Device videos and strategy data are saved in the visitor's browser, not in this repository or a cloud account. Each visitor has their own data. Clearing browser site data can remove it; use the planner's strategy export to keep a backup.
- GitHub Pages serves the app; it does not receive the visitor's maps or local video files through this project.

## License and included artwork

No software license is included yet, so public visibility does not grant permission to reuse or redistribute the code. The planner HTML contains embedded images and fonts. Review the rights for all bundled artwork and add an appropriate license before inviting others to copy or modify the project. *Where Winds Meet* and related game materials belong to their respective owners.

Ambient sound credits:

- The fish-catch meow is the MP3 provided by the project owner and is included as `assets/cat-cute-meow.mp3`.
- The panda and duck runner sound is the MP3 provided by the project owner and is included as `assets/runner-running.mp3`.
- The duck’s call is layered over the running sound and uses the MP3 provided by the project owner at `assets/duck-calling.mp3`.
