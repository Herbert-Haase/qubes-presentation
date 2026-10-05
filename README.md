<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Contents**

- [Welcome to Slidev](#welcome-to-slidev)
  - [nix](#nix)
    - [deploy](#deploy)
  - [Option 1: Serve it locally](#option-1-serve-it-locally)
  - [Option 2: Deploy to a subfolder (GitHub Pages, etc.)](#option-2-deploy-to-a-subfolder-github-pages-etc)
  - [Option 3: A single file you can open or send around](#option-3-a-single-file-you-can-open-or-send-around)
  - [Option 4: Offline-friendly build](#option-4-offline-friendly-build)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Welcome to [Slidev](https://github.com/slidevjs/slidev)

To start the slide show:

- `npm install`
- `npm run dev`
- visit <http://localhost:3030>
- npx slidev slides.md

if css doesn't apply, reload

```sh
npm exec slidev -- --force
# or
npx slidev --force
```

## nix

In your presentation directory, create a shell.nix file to declare the Node.js dependency without polluting your global system environment:

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.nodejs_22
  ];
}
```

```sh
# Drop into the Nix shell containing Node.js
nix-shell

# Run Slidev directly via npx without global installation
npx slidev@latest
```

Alternatively, run an ad-hoc shell without creating a shell.nix file:

```sh
nix shell nixpkgs#nodejs --command npx slidev@latest
```

### deploy

build to html using:

```sh
npm exec slidev build
```

Your build worked. The `index.html` is not malformed, it just looks nearly empty because Slidev builds a **single-page app (SPA)**. The slides are not in the HTML. The HTML is a shell (`<div id="app"></div>`) and the slides are rendered at runtime by the JavaScript in `dist/assets/`. That is also why `404.html` is identical to `index.html`: it lets hosts like GitHub Pages serve the app for any route.

The problem is the absolute paths (`/assets/...`, `/qubes-logo-icon.png`). They only work when `dist/` is served from the root of a web server. If you double-click `index.html` (a `file://` URL), the browser looks for `/assets/...` at the root of your disk and finds nothing, and module scripts are also blocked from `file://` by CORS.

## Option 1: Serve it locally

```bash
npx serve dist
# or
python3 -m http.server -d dist 8000
```

Then open the printed `http://localhost:...` address.

## Option 2: Deploy to a subfolder (GitHub Pages, etc.)

Set the base path at build time:

```bash
npx slidev build --base /my-repo/
```

Use your repository or folder name, with leading and trailing slashes. Without this, assets break when the site isn't at the domain root.

## Option 3: A single file you can open or send around

HTML can't really hold these slides as one static file, so export instead:

```bash
# PDF (needs a one-time install)
npm i -D playwright-chromium
npx slidev export

# PNG per slide, or PPTX
npx slidev export --format png
npx slidev export --format pptx
```

If you want a PDF with your click animations as separate pages, add `--with-clicks`.

## Option 4: Offline-friendly build

Your page loads fonts from Google Fonts and the favicon from jsdelivr, so an offline presentation would fall back to default fonts. If you need to present without internet, serve `dist/` locally as in Option 1, or use the dev server (`npx slidev`) at the venue.

One more thing from your build output: the preloads show `/templates_screenshot.png`, `/gaming.png` and others, so those images are being found in `public/`. If any image is missing after deployment, check that its filename case matches exactly, since Linux hosts are case-sensitive.
