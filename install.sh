#!/usr/bin/env sh
# Install the teamhenkler beamer theme so every LaTeX document on this
# computer can use \usetheme{teamhenkler} -- macOS and Linux.
#
#   ./install.sh               install for the current user (no admin rights)
#   ./install.sh --system      install for all users (asks for sudo)
#   ./install.sh --uninstall   remove the user installation
#
# The theme folder is *linked*, not copied: a `git pull` in this repository
# updates the installed theme immediately.
set -e

REPO_DIR=$(cd "$(dirname "$0")" && pwd)
SRC="$REPO_DIR/Presentation-Latex/teamhenkler"
MODE="${1:-user}"

if ! command -v kpsewhich >/dev/null 2>&1; then
    echo "error: kpsewhich not found -- is a TeX distribution (TeX Live / MacTeX) installed?" >&2
    exit 1
fi

case "$MODE" in
    user|--user)    TREE=$(kpsewhich -var-value TEXMFHOME);  SUDO="" ;;
    --system)       TREE=$(kpsewhich -var-value TEXMFLOCAL); SUDO="sudo" ;;
    --uninstall)    TREE=$(kpsewhich -var-value TEXMFHOME);  SUDO="" ;;
    *) echo "usage: $0 [--system | --uninstall]" >&2; exit 2 ;;
esac

DEST="$TREE/tex/latex/teamhenkler"

if [ "$MODE" = "--uninstall" ]; then
    if [ -L "$DEST" ]; then
        rm "$DEST"
        echo "removed $DEST"
    else
        echo "nothing to remove at $DEST (not a link created by this script)"
    fi
    exit 0
fi

if [ -e "$DEST" ] && [ ! -L "$DEST" ]; then
    echo "error: $DEST already exists and is not a link; remove it first." >&2
    exit 1
fi

$SUDO mkdir -p "$TREE/tex/latex"
$SUDO ln -sfn "$SRC" "$DEST"

# the system tree uses a file database that must be refreshed
if [ "$MODE" = "--system" ]; then
    $SUDO mktexlsr "$TREE" >/dev/null
fi

echo "linked $DEST -> $SRC"

# check that LaTeX now finds the theme and its logos
if kpsewhich beamerthemeteamhenkler.sty >/dev/null && kpsewhich teamhenkler-logo-eu.png >/dev/null; then
    echo "ok: LaTeX finds $(kpsewhich beamerthemeteamhenkler.sty)"
else
    echo "warning: LaTeX does not find the theme yet -- see README, section Troubleshooting." >&2
    exit 1
fi
