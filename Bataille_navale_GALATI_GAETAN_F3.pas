program Bataille_navale;

uses crt;

type tour = (j1,j2);

type//Les case de position du beteau
	cell = record
		X,Y : integer;
end;

type//Le bateau
	bateau = record
		Posi : cell;
		taille : integer;
		name_Bat : string;
end;

type//Flotte de joueur
	flotte = record
		bat1 : bateau;
		bat2 : bateau;
		bat3 : bateau;
		bat4 : bateau;
		bat5 : bateau;
		pv : integer;
end;

CONST
	MAXBat : integer = 3;
	MAXFlo : integer = 5;

VAR
	casesX : cell;//Gestion de la position.
	casesY : cell;//Gestion de la position.

//Creation de la cel
procedure CreaCel ();
	//BUT: Cré les cases du jeu, les endroit où sont placer les bateau
	//ENTREE:Une position en X et en Y
	//SORTIE:La postion de chaque morceau du bateau
var
	x : integer;
	y : integer;
	posi : integer;
begin	

	textcolor (yellow);


	writeln ('Entrez la position de la cases en X ');
	readln (posi);//Creation de la position X
	casesX.X := posi;

	writeln ('Entrez la position de la cases en Y ');
	readln (posi);//Creation de la position Y
	casesY.Y := posi;		

	textcolor (white);

end;

//Creation d'un bateau
function CreaBat (var boat : bateau) : bateau;
	//BUT:Cré les bateau, qui constiuront la flotte du joueur
	//ENTREE:Le nom, la taille et la position du bateau
	//SORTIE:Un bateau.
var 
	i : integer;
	cases : cell;

begin

	boat.name_Bat := ('NoName'); 
	boat.taille := 10;

	writeln ('Entrez le nom du bateau, mon Amiral ! ');
	readln (boat.name_Bat);

	while (boat.taille > 5) or (boat.taille <= 0) DO
	begin
		writeln ('Bien, et quelle taille fera le ',boat.name_Bat,' ? (Max 5 min 1)');
		readln (boat.taille);
	end;

	writeln ('mon Amiral ! Votre bateau est terminer ! il ne reste plus qu a le placer...');

	for i := 0 to boat.taille -1 do 
		begin
			CreaCel();
			boat.posi.X := casesX.X;//affectation de la postion x, choisie dans la procedure creacel 
			boat.posi.Y := casesY.Y;//affectation de la postion y, choisie dans la procedure creacel  
		end;

	CreaBat := boat;
end;


//Programme principal
VAR
	
	boat1J1 : bateau;//Flotte du joueur 1
	boat2J1 : bateau;//Flotte du joueur 1
	boat3J1 : bateau;//Flotte du joueur 1
	boat4J1 : bateau;//Flotte du joueur 1
	boat5J1 : bateau;//Flotte du joueur 1

	boat1J2 : bateau;//Flotte du joueur 2
	boat2J2 : bateau;//Flotte du joueur 2
	boat3J2 : bateau;//Flotte du joueur 2
	boat4J2 : bateau;//Flotte du joueur 2
	boat5J2 : bateau;//Flotte du joueur 2

	Player1 : flotte;//Chaque flotte
	Player2 : flotte;//Chaque flotte
	party : tour;//Destion des tour
	cases : cell;//Cases, zone de jeu
	toucher : boolean;//Si toucher ou non

begin

	clrscr;
	textcolor (white);
	writeln('                         La Bataille Navale                        ');
	writeln('                   appuiez sur Entrez pour jouer                   ');
	readln();


	clrscr;
	textcolor (white);
	writeln('Player1, Creation de votre flotte');

		player1.pv := 5;
		Player1.bat1 := CreaBat(boat1J1);//Creation de chaque bateau de la flotte du joueur 1
		Player1.bat2 := CreaBat(boat2J1);//Creation de chaque bateau de la flotte du joueur 1
		Player1.bat3 := CreaBat(boat3J1);//Creation de chaque bateau de la flotte du joueur 1
		Player1.bat4 := CreaBat(boat4J1);//Creation de chaque bateau de la flotte du joueur 1
		Player1.bat5 := CreaBat(boat5J1);//Creation de chaque bateau de la flotte du joueur 1
		clrscr;


	writeln('Player2, creation de votre flotte');
		
		player2.pv := 5;
		Player2.bat1 := CreaBat(boat1J2);//Creation de chaque bateau de la flotte du joueur 2
		Player2.bat2 := CreaBat(boat2J2);//Creation de chaque bateau de la flotte du joueur 2
		Player2.bat3 := CreaBat(boat3J2);//Creation de chaque bateau de la flotte du joueur 2
		Player2.bat4 := CreaBat(boat4J2);//Creation de chaque bateau de la flotte du joueur 2
		Player2.bat5 := CreaBat(boat5J2);//Creation de chaque bateau de la flotte du joueur 2
		clrscr;
	while (Player1.pv <> 0) OR (Player2.pv <> 0) do//Tant que L'un des joueur a encore de la vie ont continue
	begin
		party := j1;

		while (party = j1) DO//Tant que le joueur n'a pas finit son tour, ont continue
		begin
			clrscr;
			writeln('Player1, a votre tour');
			readln(cases.X);
			writeln(cases.X);
			readln(cases.Y);
			writeln(cases.Y);
			//writeln (Player2.bat1.posi.X);//DEBUG
	
			if (cases.X = Player2.bat1.posi.X) and (cases.y = Player2.bat1.posi.Y)
			then//Si la case en x bateau du player2 et la case en Y bateau du player2, ont touche la cible
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player2.bat1.name_Bat);
					player2.bat1.taille := player2.bat1.taille - 1;
				end
	
			else if (cases.X = Player2.bat2.posi.X) and (cases.y = Player2.bat2.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player2.bat2.name_Bat);
					player2.bat2.taille := player2.bat2.taille - 1;
				end
	
			else if (cases.X = Player2.bat3.posi.X) and (cases.y = Player2.bat3.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player2.bat3.name_Bat);
					player2.bat3.taille := player2.bat3.taille - 1;
				end
	
			else if (cases.X = Player2.bat4.posi.X) and (cases.y = Player2.bat4.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player2.bat4.name_Bat);
					player2.bat4.taille := player2.bat4.taille - 1;
				end
	
			else if (cases.X = Player2.bat5.posi.X) and (cases.y = Player2.bat5.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le',player2.bat5.name_Bat);
					player2.bat5.taille := player2.bat5.taille - 1;
				end
			else if (cases.X <> Player2.bat5.posi.X) OR (cases.y <> Player2.bat5.posi.Y)
			then
				begin 
					textcolor (red);
					writeln ('Amiral... Nous avons rater la cible...');
					textcolor (white);
					party := j2;

				end;
	
			if (toucher) and (player2.bat1.taille = 0) OR (player2.bat2.taille = 0) OR (player2.bat3.taille = 0) OR (player2.bat4.taille = 0) OR (player2.bat5.taille = 0) 
			then
				begin
				textcolor (green);	
				writeln ('Toucher, couller mon Amiral !');
				player2.pv := Player2.pv -1;
				textcolor (white);
	
				end;
			readln();
			party := j2;//Debut du tour du joueur 2
		end;

		while (party = j2) DO//Tant que le joueur n'a pas finit son tour, ont continue
		begin
			clrscr;
			writeln('Player2, a votre tour');
			readln(cases.X);
			writeln(cases.X);
			readln(cases.Y);
			writeln(cases.Y);
	
			if (cases.X = player1.bat1.posi.X) and (cases.y = player1.bat1.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player1.bat1.name_Bat);
					player1.bat1.taille := player1.bat1.taille - 1;
				end
	
			else if (cases.X = player1.bat2.posi.X) and (cases.y = player1.bat2.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player1.bat2.name_Bat);
					player1.bat2.taille := player1.bat2.taille - 1;
				end
	
			else if (cases.X = player1.bat3.posi.X) and (cases.y = player1.bat3.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player1.bat3.name_Bat);
					player1.bat3.taille := player1.bat3.taille - 1;
				end
	
			else if (cases.X = player1.bat4.posi.X) and (cases.y = player1.bat4.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le ',player1.bat4.name_Bat);
					player1.bat4.taille := player1.bat4.taille - 1;
				end
	
			else if (cases.X = player1.bat5.posi.X) and (cases.y = player1.bat5.posi.Y)
			then
				begin 
					toucher := true;
					writeln ('Amiral vous avez toucher le',player1.bat5.name_Bat);
					player1.bat5.taille := player1.bat5.taille - 1;
				end
			else if (cases.X <> player1.bat5.posi.X) OR (cases.y <> player1.bat5.posi.Y)
			then
				begin 
				textcolor (red);
				writeln ('Amiral... Nous avons rater la cible...');
				textcolor (white);
				end;
	
			if (toucher) and (player1.bat1.taille = 0) OR (player1.bat2.taille = 0) OR (player1.bat3.taille = 0) OR (player1.bat4.taille = 0) OR (player1.bat5.taille = 0) 
			then
				begin
				textcolor (green);
				writeln ('Toucher, couller mon Amiral !');
				player1.pv := player1.pv -1;//Un bateau en moins, le joueur pert une vie
				textcolor (white);
	
				end;
			readln();
			party := j1;//Debut du tour du joueur 1
		end;
	

end;

	textcolor (green);

	if (player1.pv = 0) then
		writeln ('Le joueur 2 a gagner !' );
	
	if (player2.pv = 0) then
		writeln ('Le joueur 1 a gagner !' );

	readln();


end.