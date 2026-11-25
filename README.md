# Strawberry Where Winds Meet Planner

A browser-based strategy planner for **Where Winds Meet**. It runs as a static website; it does not need a backend or build step.

## Features

- Image and video map editors with separate backgrounds.
- Import a map image or use a device video as the map background.
- Import YouTube links and supported direct video links. Playback remains in the planner when the video permits embedding.
- Place players and markers, draw and annotate plans, and export strategies.
- Store planner data in the current browser. No account is required.

## Publish on GitHub Pages

1. Open this folder in GitHub Desktop with **File → Add local repository**: `Strawberry_WhereWindsMeet_Planner_GitHub`.
2. Commit the listed project files to `main`, then choose **Publish repository** and set it to **Public**.
3. In the new GitHub repository, open **Settings → Pages** and select **GitHub Actions** as the build and deployment source.
4. In **Actions**, run **Deploy planner to GitHub Pages** once if the first push happened before Pages was enabled. Future pushes to `main` deploy automatically. The site URL appears under **Settings → Pages** and in a successful workflow run.

If you prefer the GitHub website, create an empty public repository, then add this folder as the local repository in GitHub Desktop and set that new repository as its remote before pushing `main`.

The entry page is `index.html`, so no URL rewrite or application server is needed on GitHub Pages. HTTPS hosting also provides YouTube's embedded player with a normal site referrer.

## Run locally on Windows

Double-click `Start_Planner_Locally.cmd` and keep the opened PowerShell window running. It opens the planner at `http://127.0.0.1:8765/`. This is needed for YouTube embeds when previewing locally; opening `index.html` directly as a `file://` URL can produce YouTube error 153.

## Video and browser storage notes

- YouTube videos must allow embedded playback. A video that blocks embedding cannot be made playable inside the planner.
- Direct video URLs must point to a browser-supported video file and the host must allow the browser to load it.
- Device videos and strategy data are saved in the visitor's browser, not in this repository or a cloud account. Each visitor has their own data. Clearing browser site data can remove it; use the planner's strategy export to keep a backup.
- GitHub Pages serves the app; it does not receive the visitor's maps or local video files through this project.

## License and included artwork

No software license is included yet, so public visibility does not grant permission to reuse or redistribute the code. The planner HTML contains embedded images and fonts. Review the rights for all bundled artwork and add an appropriate license before inviting others to copy or modify the project. *Where Winds Meet* and related game materials belong to their respective owners.
