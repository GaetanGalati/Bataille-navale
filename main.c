#include <stdio.h>
#include <stdlib.h>

#define TAILLE 5//Taille du carré
#define X_INITIAL 3//Postion initial de X
#define Y_INITIAL 2//Postion initial de Y

typedef struct tJeton
{
    int nX;
    int nY;

}tJeton;//Structure tJeton, composer des coordonées en X et en Y de Jeton

typedef enum Bool {true=1, false=0}Bool;//enum qui sert de Boolean

void InitTab(int nTab[TAILLE][TAILLE]);
void Moving(int nTab[TAILLE][TAILLE], tJeton *jeton, int nCpt);
void Warp(int nTab[TAILLE][TAILLE], tJeton *jeton);
void Place(int nTab[TAILLE][TAILLE], tJeton jeton, int nCpt);
void Display(int nTab[TAILLE][TAILLE]);
Bool CaseIsVoid(int nTab[TAILLE][TAILLE], tJeton jeton);


//**********************************************************
//Description : Le main.
//
//Entrées : Aucune.
//
//Sorties :	Chaque étapes du caré magique.
//
//Note : L’utilisateur n’entre aucune entrée durant tout le programme.
//
//**********************************************************
int main()

{
    int nTab[TAILLE][TAILLE];
    tJeton Jeton={X_INITIAL, Y_INITIAL};
    InitTab(nTab);
    int nCpt = 1;
    for (nCpt; nCpt < TAILLE*TAILLE+1; nCpt++)//Boucle "principal" du programme.
    {
        Moving(nTab, &Jeton, nCpt);//Déplacement du "Jeton"
    }

    Display(nTab);//Affichage

    return 0;
}


//**********************************************************
//Description : Initialisation du Tableau a 0 en X et en Y
//
//Entrées : nTab.
//
//Sorties :	le tableau nTab initialiser a 0
//
//Note : i et j représente X et Y
//
//**********************************************************
void InitTab(int nTab[TAILLE][TAILLE])
{
    int i = 0;
    for (i; i < TAILLE; i++)
    {
        int j =0;
        for (j ; j < TAILLE; j++)
        {
            nTab[i][j] = 0;//Initialisation a 0
        }
    }
}


//**********************************************************
//Description : "Warp" permet de faire un caré "sphérique" quand le jeton sortira des limites il sera remit de l'autre côté
//
//Entrées : le tableau nTab, et le jeton (pointeur)
//
//Sorties :	Nouvelle valeurs pour jeton->nX OU jeton->nY
//
//Note : Chaque if représente un des "côtés" du caré magique, Droite, Gauche, Bas, Haut
//
//**********************************************************
void Warp(int nTab[TAILLE][TAILLE], tJeton *jeton)
{
    if (jeton->nX == TAILLE+1)
    {
        jeton->nX = 1;
    }
    else if (jeton->nX == 0)
    {
        jeton->nX = TAILLE;
    }

    if (jeton->nY == TAILLE+1)
    {
        jeton->nY = 1;
    }
    else if (jeton->nY == 0)
    {
        jeton->nY = TAILLE;
    }
}


//**********************************************************
//Description : Vérification de la valeur de la case, si elle vaut 0 elle est vide, sinon elle est remplie
//
//Entrées : le tableau nTab, et le jeton
//
//Sorties :	true ou false (enumération Bool)
//
//Note : X
//
//**********************************************************
Bool CaseIsVoid (int nTab[TAILLE][TAILLE], tJeton jeton)
{
    if(nTab[jeton.nX-1][jeton.nY-1]==0)// Si la case est vide
    {
        return true;//Retourner true
    }
    else
    {
        return false;//Sinon retourner False
    }
}


//**********************************************************
//Description : Simple procedure qui sert a affecter une valeur a la case
//
//Entrées : le tableau nTab, le jeton et un entier.
//
//Sorties :	Aucune
//
//Note : X
//
//**********************************************************
void Place(int nTab[TAILLE][TAILLE], tJeton jeton, int nCpt)
{
    nTab[jeton.nX-1][jeton.nY-1] = nCpt;
}


//**********************************************************
//Description :  procedure qui permet le déplacement du jeton sur le tablau.
//
//Entrées : le tableau nTab, le jeton (pointeur) et un entier.
//
//Sorties :	Aucune
//
//Note : X
//
//**********************************************************
void Moving(int nTab[TAILLE][TAILLE], tJeton *jeton, int nCpt)
{
    if(CaseIsVoid(nTab, *jeton) == true)// Si la case est vide (utilisation de la fonction CaseIsVoid )
    {
        Place(nTab, *jeton, nCpt);
    }

    jeton->nX++;//position nX +
    jeton->nY--;//position nY -
    Warp(nTab, jeton);//Lacement de Warp (vérification de si le jeton sort des limites de la map)
    Display(nTab);//Lancement Display de Affichage du tableau
    printf("\n");//Saut de ligne

    if(CaseIsVoid(nTab, *jeton) == false && nCpt != TAILLE*TAILLE)//Si la case n'est pas vide  (utilisation de la fonction CaseIsVoid )
    {
        jeton->nX--;
        Warp(nTab, jeton);
        jeton->nY--;
        Warp(nTab, jeton);
    }
}

//**********************************************************
//Description :  Procédure qui s'occupe de l'affichage du carré magique
//
//Entrées : le tableau nTab.
//
//Sorties :	Affichage
//
//Note : X
//
//**********************************************************
void Display(int nTab[TAILLE][TAILLE])
{
    int y = 0;
    for (y; y < TAILLE; y++)
    {
        int x=0;
        for (x; x < TAILLE; x++)
        {
            printf("%2d ", nTab[x][y]);//Afichage du tableau en X et Y
        }
        printf("\n");//Saut de ligne
    }
}
