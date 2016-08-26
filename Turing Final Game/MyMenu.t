%Menu%
class MyMenu

    export drawMenu, drawGameMenu

    var MenuLogo : int := Pic.FileNew ("MenuLogo.jpg")
    var MenuStartButton : int := Pic.FileNew ("StartMenuStart.jpg")
    var MenuStartButtonsize : int := Pic.Scale (MenuStartButton, 640, 400)
    var MenuStartButton1 : int := Pic.FileNew ("StartMenuControls.jpg")
    var MenuStartButton1size : int := Pic.Scale (MenuStartButton1, 640, 400)
    var MenuStartButton2 : int := Pic.FileNew ("StartMenuObjective.jpg")
    var MenuStartButton2size : int := Pic.Scale (MenuStartButton2, 640, 400)
    var MenuStartControl1 : int := Pic.FileNew ("StartMenuBlur.jpg")
    var MenuStartObjective0 : int := Pic.FileNew ("StartMenuObjectiveBlur.jpg")
    var MenuStartControl2 : int := Pic.FileNew ("StartMenuControlScreen.jpg")
    var MenuStartControl2size : int := Pic.Scale (MenuStartControl2, 640, 400)
    var MenuStartControl3 : int := Pic.FileNew ("StartMenuControlScreenPressed.jpg")
    var MenuStartControl3size : int := Pic.Scale (MenuStartControl3, 640, 400)
    var MenuStartObjective1 : int := Pic.FileNew ("StartMenuObjectiveScreen.jpg")
    var MenuStartObjective1size : int := Pic.Scale (MenuStartObjective1, 640, 400)
    var MenuStartObjective2 : int := Pic.FileNew ("StartMenuObjectiveScreenPressed.jpg")
    var MenuStartObjective2size : int := Pic.Scale (MenuStartObjective2, 640, 400)
    var MenuStartBlack : int := Pic.FileNew ("StartMenuBlack.jpg")
    var MenuStartB : int := Pic.FileNew ("StartMenu.jpg")
    var MenuStartBsize : int := Pic.Scale (MenuStartB, 640, 400)

    var font := Font.New ("Helvetica:12")
    var text := "Press Any Key To Continue"
    var width := Font.Width (text, font)
    var x, y, button : int


    % SPLASH MENU %


    procedure drawMenu

	Music.PlayFileLoop ("Intro.wav")
	Pic.DrawSpecial (MenuLogo, 90, 100, picCopy, picFadeIn, 2000)
	delay (3600)
	Music.PlayFileStop
	delay (200)
	Pic.Draw (Pic.Scale (Pic.FileNew ("Loading1.jpg"), 200, 50), 210, 100, picCopy)
	delay (1000)
	Pic.Draw (Pic.Scale (Pic.FileNew ("Loading2.jpg"), 200, 50), 210, 100, picCopy)
	delay (1000)
	Pic.Draw (Pic.Scale (Pic.FileNew ("Loading3.jpg"), 200, 50), 210, 100, picCopy)
	delay (1000)
	Pic.Draw (Pic.Scale (Pic.FileNew ("Loading4.jpg"), 200, 50), 210, 100, picCopy)
	delay (1000)
	Pic.Draw (Pic.Scale (Pic.FileNew ("Loading5.jpg"), 200, 50), 210, 100, picCopy)

	delay (500)
	cls
	Pic.Draw (MenuLogo, 90, 100, picCopy)


	loop
	    Font.Draw (text, round (maxx / 2 - width / 2), 130, font, black)
	    delay (500)
	    Font.Draw (text, round (maxx / 2 - width / 2), 130, font, white)
	    delay (500)
	    exit when hasch
	end loop

    end drawMenu

    % End of Splash Menu

    % GAME MENU %


    procedure drawGameMenu
	Music.PlayFileLoop ("GameofThrones.wav")
	Pic.Free (MenuStartButton)
	Pic.Free (MenuStartB)

	loop
	    delay (2)
	    mousewhere (x, y, button)

	    %Start Button Highlighted
	    if x >= 240 and x <= 400 and y > 180 and y < 240 then
		MenuStartButton := Pic.FileNew ("StartMenuStart.jpg")
		MenuStartButtonsize := Pic.Scale (MenuStartButton, 640, 400)
		Pic.Draw (MenuStartButton, 0, 0, picCopy)
		Pic.Free (MenuStartButton)
		Pic.Free (MenuStartButtonsize) 
		%Contols Button Highlighted
	    elsif x >= 240 and x <= 400 and y > 110 and y < 170 then
		MenuStartButton1 := Pic.FileNew ("StartMenuControls.jpg")
		MenuStartButton1size := Pic.Scale (MenuStartButton1, 640, 400)
		Pic.Draw (MenuStartButton1size, 0, 0, picCopy)
		Pic.Free (MenuStartButton1)
		Pic.Free (MenuStartButton1size)
		%Contols Button Clicked
		if x >= 240 and x <= 400 and y > 110 and y < 170 and button = 1 then
		    MenuStartControl1 := Pic.FileNew ("StartMenuBlur.jpg")
		    Pic.DrawSpecial (Pic.Scale (MenuStartControl1, 640, 400), 0, 0, picCopy, picFadeIn, 1000)
		    Pic.Free (MenuStartControl1)
		    loop
			mousewhere (x, y, button)
			if x >= 400 and x <= 560 and y > 45 and y < 105 then
			    MenuStartControl3 := Pic.FileNew ("StartMenuControlScreenPressed.jpg")
			    MenuStartControl3size := Pic.Scale (MenuStartControl3, 640, 400)
			    Pic.Draw (MenuStartControl3size, 0, 0, picCopy)
			    Pic.Free (MenuStartControl3)
			    Pic.Free (MenuStartControl3size) 
			else
			    MenuStartControl2 := Pic.FileNew ("StartMenuControlScreen.jpg")
			    MenuStartControl2size := Pic.Scale (MenuStartControl2, 640, 400)
			    Pic.Draw (MenuStartControl2size, 0, 0, picCopy)
			    Pic.Free (MenuStartControl2)
			    Pic.Free (MenuStartControl2size)
			end if
			exit when x >= 400 and x <= 560 and y > 45 and y < 105 and button = 1
		    end loop
		end if
		%Objective Button Highlighted
	    elsif x >= 240 and x <= 400 and y > 40 and y < 100 then
		MenuStartButton2 := Pic.FileNew ("StartMenuObjective.jpg")
		MenuStartButton2size := Pic.Scale (MenuStartButton2, 640, 400)
		Pic.Draw (MenuStartButton2size, 0, 0, picCopy)
		Pic.Free (MenuStartButton2)
		Pic.Free (MenuStartButton2size)
		%Objective Button Clicked
		if x >= 240 and x <= 400 and y > 40 and y < 100 and button = 1 then
		    MenuStartObjective0 := Pic.FileNew ("StartMenuObjectiveBlur.jpg")
		    Pic.DrawSpecial (Pic.Scale (MenuStartObjective0, 640, 400), 0, 0, picCopy, picFadeIn, 1000)
		    Pic.Free (MenuStartObjective0)
		    loop
			mousewhere (x, y, button)
			if x >= 415 and x <= 545 and y > 50 and y < 105 then
			    MenuStartObjective2 := Pic.FileNew ("StartMenuObjectiveScreenPressed.jpg")
			    MenuStartObjective2size := Pic.Scale (MenuStartObjective2, 640, 400)
			    Pic.Draw (MenuStartObjective2, 0, 0, picCopy)
			    Pic.Free (MenuStartObjective2)
			    Pic.Free (MenuStartObjective2size) 
			else
			    MenuStartObjective1 := Pic.FileNew ("StartMenuObjectiveScreen.jpg")
			    MenuStartObjective1size := Pic.Scale (MenuStartObjective1, 640, 400)
			    Pic.Draw (MenuStartObjective1, 0, 0, picCopy)
			    Pic.Free (MenuStartObjective1)
			    Pic.Free (MenuStartObjective1size) 
			end if
			exit when x >= 415 and x <= 545 and y > 50 and y < 105 and button = 1
		    end loop
		end if
		%Regular Menu
	    else
		MenuStartB := Pic.FileNew ("StartMenu.jpg")
		MenuStartBsize := Pic.Scale (MenuStartB, 640, 400)
		Pic.Draw (MenuStartBsize, 0, 0, picCopy)
		Pic.Free (MenuStartB)
		Pic.Free (MenuStartBsize)
	    end if
	    %Start Button Clicked
	    exit when x >= 240 and x <= 400 and y > 180 and y < 240 and button = 1
	end loop
	Music.PlayFileStop
	Pic.DrawSpecial (Pic.Scale (MenuStartBlack, 640, 400), 0, 0, picCopy, picFadeIn, 500)

    end drawGameMenu

    %End of Game Menu


end MyMenu

type MyMenuClass : pointer to MyMenu


procedure ConstructMenu (var iMenu : MyMenuClass)
    % Initialise the object's fields
    new MyMenu, iMenu
    setscreen ("graphics")
end ConstructMenu


procedure DestructMenu (var iMenu : MyMenuClass)
    free iMenu
end DestructMenu
