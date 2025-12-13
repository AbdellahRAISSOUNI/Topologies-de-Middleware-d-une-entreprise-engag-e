# Makefile pour compiler le rapport LaTeX

# Nom du fichier principal (sans extension)
MAIN = rapport_atelier_middleware

# Compilateur LaTeX
LATEX = pdflatex

# Options de compilation
LATEX_OPTIONS = -interaction=nonstopmode -file-line-error

# Fichiers à nettoyer
CLEAN_EXTENSIONS = aux log out toc lof lot bbl blg nav snm vrb fdb_latexmk fls synctex.gz

.PHONY: all clean pdf view

# Compilation par défaut
all: pdf

# Compilation du PDF (deux passes pour les références)
pdf:
	@echo "Compilation première passe..."
	$(LATEX) $(LATEX_OPTIONS) $(MAIN).tex
	@echo "Compilation deuxième passe (pour les références)..."
	$(LATEX) $(LATEX_OPTIONS) $(MAIN).tex
	@echo "Compilation terminée : $(MAIN).pdf"

# Nettoyage des fichiers temporaires
clean:
	@echo "Nettoyage des fichiers temporaires..."
	@for ext in $(CLEAN_EXTENSIONS); do \
		rm -f $(MAIN).$$ext; \
	done
	@echo "Nettoyage terminé."

# Nettoyage complet (inclut le PDF)
cleanall: clean
	@echo "Suppression du PDF..."
	@rm -f $(MAIN).pdf
	@echo "Nettoyage complet terminé."

# Ouvrir le PDF (Linux)
view: pdf
	@if command -v xdg-open > /dev/null; then \
		xdg-open $(MAIN).pdf; \
	elif command -v evince > /dev/null; then \
		evince $(MAIN).pdf &; \
	fi

# Aide
help:
	@echo "Commandes disponibles :"
	@echo "  make       - Compiler le rapport"
	@echo "  make clean - Nettoyer les fichiers temporaires"
	@echo "  make cleanall - Nettoyer tout (y compris le PDF)"
	@echo "  make view  - Compiler et ouvrir le PDF (Linux)"
	@echo "  make help  - Afficher cette aide"




