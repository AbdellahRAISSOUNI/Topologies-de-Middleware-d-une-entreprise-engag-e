# Guide de Compilation du Rapport LaTeX

## Prérequis

Pour compiler ce rapport, vous devez avoir installé :

1. **LaTeX Distribution** :
   - **Windows** : MiKTeX ou TeX Live
   - **Linux** : `sudo apt-get install texlive-full` (ou équivalent)
   - **macOS** : MacTeX

2. **Packages LaTeX nécessaires** :
   - `babel` (français)
   - `tikz` et `pgfplots` (diagrammes)
   - `listings` (code)
   - `hyperref` (liens)
   - `booktabs` (tableaux)
   - `fancyhdr` (en-têtes/pieds de page)

## Compilation

### Méthode 1 : Compilation Manuelle

```bash
pdflatex rapport_atelier_middleware.tex
pdflatex rapport_atelier_middleware.tex  # Deux fois pour les références
```

### Méthode 2 : Utiliser le Makefile (Linux/macOS)

```bash
make
```

ou

```bash
make clean  # Nettoyer les fichiers temporaires
make        # Compiler
```

### Méthode 3 : Utiliser un IDE LaTeX

- **TeXstudio** (recommandé)
- **Overleaf** (en ligne, pas d'installation)
- **TeXmaker**
- **VS Code** avec extension LaTeX Workshop

## Structure du Document

Le document est organisé en sections :
- Introduction
- Fondamentaux du Middleware
- Topologies de Middleware
- Enterprise Integration Patterns
- Cas d'Usage et Comparaisons
- Partie Pratique (à compléter)
- Conclusion
- Bibliographie

## Personnalisation

### Modifier les Couleurs

Les couleurs sont définies dans le préambule :
```latex
\definecolor{bleu}{RGB}{41,128,185}
\definecolor{vert}{RGB}{39,174,96}
\definecolor{rouge}{RGB}{231,76,60}
\definecolor{gris}{RGB}{127,140,141}
```

### Modifier les Auteurs

Les noms des auteurs sont dans la page de titre. Modifiez-les si nécessaire.

## Notes Importantes

- La **Section 6 (Partie Pratique)** est marquée comme "à compléter" - vous devrez remplir cette section après avoir réalisé l'atelier
- Les diagrammes utilisent TikZ - vous pouvez les modifier selon vos besoins
- Le document utilise des références croisées - compilez deux fois pour que les numéros soient corrects

## Résolution de Problèmes

### Erreur "Package not found"
Installez le package manquant :
- **MiKTeX** : Installe automatiquement
- **TeX Live** : `sudo tlmgr install <package>`

### Erreur de compilation
- Vérifiez que tous les packages sont installés
- Compilez deux fois (pour les références)
- Vérifiez les logs d'erreur dans le fichier `.log`

## Support

Pour toute question sur LaTeX :
- Documentation : https://www.latex-project.org/
- Overleaf Learn : https://www.overleaf.com/learn








