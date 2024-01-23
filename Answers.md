# SwiftUI - UnsplashApp

## 2 - Grid

### Exercice 1

- LazyVGrid est une grille vertical qui qui arrange automatiquement les items qu'on lui confie pour crée une grille qui s'etend verticalement. On l'utilise car nous avons besoins d'afficher des images dans ce format de grilles vertical comme instagram, qui gerer automatiqument les emplacement des items.

- Il existe plusieurs type de colonne comme .fixed qui permet de crée une colonne à la taille donnée, adaptive qui s'adapte (comme son nom l'indique) a son contenu et ses valeurs minimale et maximale, flexible qui permet de crée une colonne qui s'adapte sur l'espace disponible ce qui est idéal dans notre cas.

- Les images prennent toute la largeur de l'ecran car les items se regroupent sur la premiere colonne qui prend par consequent l'espace disponible de la deuxieme.

## 3 - Content-Negociation

### Exercice 2

- Pour afficher une image nous avons principalement besoin de son url. L'id de l'image et le nom de son auteur peuvent aussi ëtre utile si nous souhaitons les afficher dans l'application, le slug de l'image également. La description de l'image peut également être utile dans une moindre mesure.

### Exercice 3 

-  GCD est la methode historique pour faire des taches insynchrones, elle etait compliqué a utilisé et a comprendre. Maintenant, depuis Swift 5.5 la methode Async/Await à été introduite et permet un code plusconscis et compréhensible. Mais il y a egalement combine qui permet de declaré l'appel asynchrone, cela peut paraitre complexe à premiere vue mais cela permet de faire du code réactif. Async/Await et Combine offre tout les 2 des avantages et quelques inconvenient l'un a l'autre.