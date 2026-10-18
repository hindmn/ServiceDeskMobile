# ServiceDeskMobile
Projet 1 : 420-249-AH Programmation mobile iOS
Fait par : Hind Manouzi

La structure du projet (MVVM):
\ServiceDeskMobile
- \Models          --> Contient les fichiers qui sont utilisés par les 4 couches de ce projet, le fichier Validation ajoute une règle au titre qui le                       rend obligatoire.
- \Services        --> Contient des fichiers déjà fournis qui sont les seuls qui peuvent lire et écrire les fichiers JSON.
- \ViewModels      --> Contient les fichiers d'état des écrans et leurs actions
- \Views           --> Contient les fichiers d'affichage, la saisie et la navigation uniquement

Les fichiers JSON:
- tickets.json : Il contient le tableau des tickets et il a été créé par TicketsViewModel
- preferences.json : Il contient les préférences du projet comme le mode sombre et il a été créé par ParametreViewModel

Les principaux choix techniques:
- On utilise "afficherTickets" qui applique la recherche insensible à la casse sur le titre, description et catégorie, puis un filtre sur le statut et la priorite. Cette variable retourne par la suite la liste de tickets triées
- Pour la section "Tickets", on utilise
