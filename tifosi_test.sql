/* 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant */
SELECT nom_foccacia FROM `foccacia` 
ORDER BY nom_foccacia;

/* 
Résultat attendu : 
    Une liste des noms des foccacias uniquement trié dans l'odre alphabétique

Résultat obtenue : 
    nom_foccacia Croissant 1
    Américaine
    Emmentalaccia
    Gorgonzollaccia
    Hawaienne
    Mozaccia
    Paysanne
    Raclaccia
    Tradizione

Commentaire :
    Conforme au résultat attendu 
*/

/* 2. Afficher le nombre total d'ingrédients */
SELECT COUNT(id_ingredient) AS `nbr_total_ingredient` FROM `ingredient`;

/* 
Résultat attendu : 
    Un monbre unique contenant le nombre total d'ingédient

Résultat obtenue : 
    nbr_total_ingredient
    25

Commentaire : 
    Conforme au résultat attendu 
*/

/* 3. Afficher le prix moyen des focaccias */
SELECT CAST(AVG(prix_foccacia) AS DECIMAL(5,2)) AS `prix_moyen_foccacia` FROM `foccacia`;

/* 
Résultat attendu : 
    Un monbre unique contenant le prix moyen des foccacias

Résultat obtenue : 
    prix_moyen_foccacia
    10.38

Commentaire : 
    Avec la function CAST le résultat respecte le type " DECIMAL(5,2) "  
*/

/* 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson */
SELECT boisson.nom_boisson, marque.nom_marque FROM `boisson`
INNER JOIN marque ON(
        boisson.id_marque = marque.id_marque
    )
ORDER BY
    boisson.nom_boisson;

/* 
Résultat attendu : 
    Une liste a deux colonnes avec le nom des boissons et le nom des marques associés et trié par nom de boisson

Résultat obtenue : 
    nom_boisson Croissant 1     nom_marque
    Capri-sun                   Coca-cola
    Coca-cola original          Coca-cola
    Coca-cola zéro              Coca-cola
    Eau de source               Cristalline
    Fanta citron                Coca-cola
    Fanta orange                Coca-cola
    Lipton Peach                Pepsico
    Lipton zéro citron          Pepsico
    Monster energy ultra blue   Monster
    Monster energy ultra gold   Monster
    Pepsi                       Pepsico
    Pepsi Max Zéro              Pepsico

Commentaire : 
    Avec la fonction INNER JOIN permet de faire le lien entre les deux tables par rapport a " id_marque "  
*/

/* 5. Afficher la liste des ingrédients pour une Raclaccia */
SELECT ingredient.nom_ingredient FROM `comprend`
INNER JOIN foccacia ON(
        comprend.id_foccacia = foccacia.id_foccacia
    )
INNER JOIN ingredient ON(
        comprend.id_ingredient = ingredient.id_ingredient
    )
WHERE
    comprend.id_foccacia = 3; -- 3 = Raclaccia

/* 
Résultat attendu : 
    Une liste a deux colonnes avec le nom de la foccacia Raclaccia et les noms des ingrédients associés

Résultat obtenue : 
    nom_ingredient	
    Ail	
    Base Tomate	
    Champignon	
    Cresson	
    Oignon	
    Parmesan	
    Poivre	
    Raclette	

Commentaire : 
    Avec la double utilisation de la fonction INNER JOIN permet de faire le lien entre les trois tables par rapport a " id_faccica " d'un coté et " id_ingredient " de l'autre
*/


/* 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia, */
SELECT foccacia.nom_foccacia, COUNT(comprend.id_ingredient) AS `nbr_total_ingredient`
FROM `comprend`
INNER JOIN foccacia ON(
        comprend.id_foccacia = foccacia.id_foccacia
    )
GROUP BY comprend.id_foccacia;

/*
Résultat attendu : 
    Une liste a deux colonnes avec le nom de chaque foccacia et le nombre d'ingredient pour chacune

Résultat obtenue : 
    nom_foccacia	nbr_total_ingredient	
    Mozaccia	    10	
    Gorgonzollaccia	8	
    Raclaccia	    8	
    Emmentalaccia	7	
    Tradizione	    9	
    Hawaienne	    9	
    Américaine	    8	
    Paysanne	    12

Commentaire : 
    Avec la fonction GROUP BY cela permet de regrouper le resultat par nom_foccacia et d'optenir le total avec COUNT sur les ingredients
*/



/* 7. Afficher le nom de la focaccia qui a le plus d'ingrédients */
SELECT foccacia.nom_foccacia FROM `comprend`
INNER JOIN foccacia ON
    (
        comprend.id_foccacia = foccacia.id_foccacia
    )
GROUP BY
    comprend.id_foccacia
ORDER BY
    COUNT(comprend.id_ingredient)
DESC
LIMIT 1;

/*
Résultat attendu : 
    Une liste avec le nom de la foccacia qui a le plus d'ingrédients

Résultat obtenue : 
    nom_foccacia
    Paysanne

Commentaire : 
    En faisant trier par nombre d'ingrients et concerver que le 1er de la liste il nous reste que la foccasia en tête de liste
*/	

/* 8. Afficher la liste des focaccia qui contiennent de l'ail */
SELECT foccacia.nom_foccacia FROM `comprend`
INNER JOIN foccacia ON
    (
        comprend.id_foccacia = foccacia.id_foccacia
    )
WHERE
    comprend.id_ingredient = 1; -- 1 = Ail

/*
Résultat attendu : 
    Une liste  avec les noms des foccacias qui a utilise de l'ail

Résultat obtenue : 
    nom_foccacia	
    Mozaccia	
    Gorgonzollaccia	
    Raclaccia	
    Paysanne

Commentaire : 
    En faisant trier par nombre d'ingrients et concerver que le 1er de la liste il nous reste que la foccasia en tête de liste
*/

/* 9. Afficher la liste des ingrédients inutilisés */
SELECT ingredient.nom_ingredient FROM `ingredient`
WHERE NOT EXISTS (
    SELECT
        1
    FROM
        comprend
    WHERE
        comprend.id_ingredient = ingredient.id_ingredient
);

/*
Résultat attendu : 
    Une liste  avec les noms des ingredients qui ne sont pas utilisés

Résultat obtenue : 
    nom_ingredient	
    Salami	
    Tomate cerise

Commentaire : 
    En partant de la liste des ingrédients et en excluant les ingredients présent dans la liste comprend cela donne les ingredients non utilisé.
*/


/* 10. Afficher la liste des focaccia qui n'ont pas de champignons */
SELECT foccacia.nom_foccacia FROM `foccacia`
WHERE NOT EXISTS (
    SELECT 
        1
    FROM 
        comprend
    WHERE 
        comprend.id_foccacia = foccacia.id_foccacia
      AND 
        comprend.id_ingredient = 7 -- 7 = Champignon
);

/*
Résultat attendu : 
    Une liste  avec les noms des foccacias qui n'ont pas de champignons

Résultat obtenue : 
    nom_foccacia	
    Hawaienne	
    Américaine

Commentaire : 
    Dans le condition de résultat l'utilisation de NOT EXISTS exclus les foccacias qui ne remplisse pas les conditions de la recherche
*/