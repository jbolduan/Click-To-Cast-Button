# Copilot Instructions for ClickToCastButton

## Build and Deploy

- **Never automatically execute `build\deploy.ps1`** - This script deploys files to the user's WoW installation and should only be run when explicitly requested by the user.
- When the user asks to deploy, remind them to run the deploy script manually rather than executing it automatically.

## Documentation Maintenance

- **Keep `README.md` up to date** - When adding new features, commands, or settings, update the README.md to reflect those changes.
- **Keep this instructions file up to date** - When adding new key files, changing project structure, or establishing new development guidelines, update this copilot-instructions.md file.
- **Limit emoji usage** - Avoid using emojis in the README.md and other documentation files. Use plain text formatting instead.
- **Ensure markdown passes linting** - All markdown files must pass linter checks with no errors or warnings. This includes proper heading hierarchy, consistent list formatting, no trailing spaces, blank lines around code blocks, and proper link syntax.

## Project Overview

This is a World of Warcraft addon that adds a convenient button to the spellbook window for quick access to click-to-cast bindings.

## Key Files

- `ClickToCastButton.lua` - Main addon code
- `ClickToCastButton.toc` - Addon metadata/manifest
- `README.md` - User documentation
- `build\deploy.ps1` - Deployment script (DO NOT AUTO-EXECUTE)
- `.github\copilot-instructions.md` - This file (Copilot workspace instructions)
