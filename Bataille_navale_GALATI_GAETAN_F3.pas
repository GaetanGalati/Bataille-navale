program batailleNavale;

uses crt;

CONST
	minLigne = 1;
	maxLigne = 50;
	minCol = 1;
	maxCol = 50;
	nbBateaux = 2;
	maxCase = 5;


TYPE cases = record
	ligne,colonne : integer;
end;

	
TYPE bateau = record
	nCase : array [1..maxCase] OF cases;
end;

TYPE flotte = record
	nBateau : array [1..nbBateaux] OF bateau;
end;

TYPE bool = (VRAI,FAUX);
TYPE posBateau = (Horizontal,Vertical,Diagonal);
TYPE etatBateau = (touche,coule);
TYPE etatFlotte = (aFlots,aSombre);
TYPE etatJoueur = (Gagne,Perdu);

VAR
	Test : bateau;
	Ca : cases;

PROCEDURE creaCase (l,c : integer;VAR test : cases);
	begin
		test.ligne := l;
		test.colonne  :=c;
	end;

FUNCTION cmpCase (mCase,tCase : Cases) : bool;
	begin 
		IF ((mCase.ligne = tCase.ligne) AND (mCase.colonne = tCase.colonne)) then
			cmpCase := VRAI;
	end;

FUNCTION creaBateau (nCase : cases;taille:integer) : bateau;
	VAR
		res : bateau;
		pos : integer;
		i : integer;
		positionB : posBateau;

	begin
		pos := Random(3);
		positionB := posBateau(pos);

		FOR i:= 1 to maxCase do
			begin
				IF (i <= taille) then
					BEGIN
						res.nCase[i].ligne := nCase.ligne;
						res.nCase[i].colonne := nCase.colonne
					END
				ELSE
					BEGIN
						res.nCase[i].ligne := 0;
						res.nCase[i].colonne := 0;
					END;

				IF (positionB = Horizontal) then
					nCase.colonne := nCase.colonne + 1;
				 IF (positionB = Vertical) then
					nCase.ligne := nCase.ligne + 1;

				 IF (positionB = Diagonal) then
				 	begin
						nCase.ligne := nCase.ligne + 1;
						nCase.colonne := nCase.colonne + 1;
				end
				
		end;

		creaBateau := res;
	END;

FUNCTION ctrlCase (nBateau : bateau;mCase : cases) : bool;

	VAR
		i : integer;
		valTest : bool;
	BEGIN
		valTest := FAUX;

		FOR i := 1 TO maxCase DO
			BEGIN
				IF (cmpCase(nBateau.nCase[i],mCase) = VRAI) Then
					valTest := VRAI;
			END;

		ctrlCase := valTest;
	end;

FUNCTION ctrlFlotte (nFlotte : flotte; nCase : cases) : bool;
	VAR
		i : integer;
		res : bool;

	BEGIN
		res := FAUX;

		FOR i := 1 TO nbBateaux DO
			begin
				IF (ctrlCase(nFlotte.nBateau[i],nCase) = VRAI) then
					res := VRAI;
			
		end;
		ctrlFlotte := res;
end;

PROCEDURE flotteJoueur (nCase : cases;VAR nflotte : flotte);
	VAR
		i : integer;
		valPosLigne,valPosColonne,valTailleBateau : integer;

	BEGIN
		for i:=1 to nbBateaux do
			begin
				valPosLigne := RANDOM(maxLigne);
				valPosColonne := RANDOM(maxCol);
				valTailleBateau := RANDOM(maxCase);
				creaCase(valPosLigne,valPosColonne,Ca);
				nFlotte.nBateau[i] := creaBateau (nCase,valTailleBateau);
		end;
	END;


VAR
	
	Cax : cases;
	Ba : bateau;
	foj1 : flotte;
	foj2 : flotte;
	bl : bool;
	choix : integer;
	j1 : etatJoueur;
	j2 : etatJoueur;

	a,b,c : integer;


BEGIN

	writeln('Bienvenu dans la bataille Navale ! ');
	readln ();
	clrscr;

	cmpCase(Ca,Cax);
	creaBateau(Ca,c);
	ctrlCase(Ba,CA);
	ctrlFlotte(foj1,Ca);
	ctrlFlotte(foj2,Ca);
	//flotteJoueur(Ca,fo);
	repeat 
		writeln('Entrez une ligne');
		readln (Cax.ligne);
		writeln('Entrez une colonne');
		readln (Cax.colonne);
		writeln (ctrlFlotte(fo,Cax));

	until (j1 = Perdu) or (j2 = Perdu);


	readln();


END.

