# TeamHenklerTemplates

LaTeX and PowerPoint templates of Team Henkler (HSHL):

| Folder | Content |
|---|---|
| `Presentation-Latex/teamhenkler/` | the **beamer theme** (`\usetheme{teamhenkler}`) with its logos |
| `Presentation-Latex/hshl-example.tex` | example presentation showing every feature |
| `Thesis/` | thesis template (`teamhenkler.cls`) |
| `Presentation-PowerPoint/` | PowerPoint templates |
| `HSHL-Logos/` | official HSHL logos |


## Installing the beamer theme computer-wide

Installed once, the theme works in **every** presentation on your computer:
no more copying `.sty` files or logo folders next to each talk.
All the logos are inside the theme folder, so they come with it.

You need a TeX distribution: [MacTeX](https://www.tug.org/mactex/) (macOS),
[TeX Live](https://www.tug.org/texlive/) (Linux, Windows) or
[MiKTeX](https://miktex.org/) (Windows).

First get the repository:

```bash
git clone https://github.com/lucabrodohshl/TeamHenklerTemplates.git
cd TeamHenklerTemplates
```

### macOS and Linux

```bash
./install.sh
```

This links `Presentation-Latex/teamhenkler/` into your personal TeX tree
(`TEXMFHOME`, i.e. `~/Library/texmf` on macOS and `~/texmf` on Linux).
No admin rights are needed, and because it is a link, a `git pull` updates the
installed theme immediately.

| Command | Effect |
|---|---|
| `./install.sh` | install for your user (recommended) |
| `./install.sh --system` | install for all users of the computer (`TEXMFLOCAL`, asks for `sudo`) |
| `./install.sh --uninstall` | remove the user installation |

<details>
<summary>Manual installation (what the script does)</summary>

```bash
TREE=$(kpsewhich -var-value TEXMFHOME)
mkdir -p "$TREE/tex/latex"
ln -s "$PWD/Presentation-Latex/teamhenkler" "$TREE/tex/latex/teamhenkler"
```
</details>

### Windows

Open PowerShell in the repository folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

The script detects your distribution:

- **MiKTeX:** copies the theme to `%USERPROFILE%\texmf\tex\latex\teamhenkler`,
  registers that folder with MiKTeX and refreshes its file database.
- **TeX Live:** copies the theme into your personal tree (`TEXMFHOME`,
  usually `%USERPROFILE%\texmf`).

On Windows the theme is **copied**: run the script again after every `git pull`.

<details>
<summary>Manual installation (what the script does)</summary>

1. Copy the folder `Presentation-Latex\teamhenkler` to
   `%USERPROFILE%\texmf\tex\latex\teamhenkler`.
2. MiKTeX only: open *MiKTeX Console* → *Settings* → *Directories*, add
   `%USERPROFILE%\texmf`, then *Tasks* → *Refresh file name database*.
</details>

### Check that it works

```bash
kpsewhich beamerthemeteamhenkler.sty
```

It must print a path inside your TeX tree. Then compile any presentation that
uses `\usetheme{teamhenkler}` from a folder **without** local copies of the theme.

### Troubleshooting

- **`kpsewhich` prints nothing.** The theme is not in a folder TeX searches.
  Check where your personal tree is with `kpsewhich -var-value TEXMFHOME` and
  that `<that folder>/tex/latex/teamhenkler/` exists.
- **An old version is used.** Delete old copies of `beamer*teamhenkler.sty` next
  to your presentation: local files take precedence over installed ones.
- **MiKTeX still does not find it.** Refresh the file name database
  (`initexmf --update-fndb`, or the MiKTeX Console task).


## Using the theme

```latex
\documentclass[aspectratio=169]{beamer}
\usetheme{teamhenkler}

\title{My Talk}
\author{Jane Doe}
\date{Conference 2026}
\email{jane.doe@hshl.de}

\thset{uni=conference,
       outer/numbering=counter,
       inner/sectionpage=none,
       outer/footlinestyle=plain}

\begin{document}
\maketitle
...
\makebib{references.bib}
\end{document}
```

| Option | Values | Effect |
|---|---|---|
| `uni` | `HSHL` (default), `FhD`, `conference`, `none` | logos and institute on the title slide; `conference` shows HSHL, AKI4KMU and the funding logos (NRW ministry, EU) |
| `outer/numbering` | `fraction` (default), `counter`, `none` | slide number as `2/12`, `2`, or not at all |
| `outer/footlinestyle` | `slick` (default), `plain` | footline with or without section navigation |
| `inner/sectionpage` | `none`, `progressbarHSHL`, `simpleHSHL`, `staticBarHSHL` | section divider slides |

`\makebib{file.bib}` produces a compact, unnumbered reference list
(small font, slides filled before breaking).

`Presentation-Latex/hshl-example.tex` shows every feature and compiles even if the
theme is not installed (it falls back to the `teamhenkler/` folder next to it).


## For the students

### Before you ask about Overleaf
We do not support Overleaf, therefore refrain from asking questions about it. The template for the thesis compiles, but the free version is limited and might not be enough to handle it, especially as you expand your work with figures, graphs etc. We expect students to use latex on local machines ( [TexStudio](https://www.texstudio.org), [Visual studio code integration](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) ) and use GitHub for version-control. 

### The chapter's name can be changed
Ultimately, you should decide the flow of your thesis. 


## Other stuff
If you have a problem with the latex template, please write an email to luca.brodo@hshl.de


## References
- [Auriga](https://github.com/anishathalye/auriga)
- [Metropolis](https://github.com/matze/mtheme)
