

include "MyMenu.t"
include "Character.t"
include "Fire.t"
include "Asteroid.t"

var iMenu : MyMenuClass
var oCharacter : CharacterClass
var oCharacter2 : CharacterClass
var oFire : FireClass
var oFire2 : FireClass
var oAsteroid : flexible array 1 .. 0 of AsteroidClass
var isExist : boolean
var isExist2 : boolean
var chars : array char of boolean
var Counter : int
var GameBG : int := Pic.FileNew ("CityBG6.jpg")
var GameBGsize : int := Pic.Scale (GameBG, 640, 400)
var EndBG : int := Pic.FileNew ("EndBG.jpg")
var EndBGSize : int := Pic.Scale (EndBG, 640, 400)
var distance_between_centres : real
var distance_between_centres2 : real
var Score : int
var Score2 : int
var Health : int
var font := Font.New ("Helvetica:18")
var text := "Hold 'SHIFT' To Play Again"
var width := Font.Width (text, font)
var Font1 : int
Font1 := Font.New ("Helvetica:32")
var Font2 : int
Font2 := Font.New ("Helvetica:32")
var FontHP : int
FontHP := Font.New ("Helvetica:12")
var Font3 : int
Font3 := Font.New ("Helvetica:12")
var Font4 : int
Font4 := Font.New ("Helvetica:12")
var keys : array char of boolean 


Counter := 0


isExist := false
isExist2 := false


% MENU %

ConstructMenu (iMenu)
iMenu -> drawMenu
cls
iMenu -> drawGameMenu
cls
DestructMenu (iMenu)

% END MENU %


setscreen ("offscreenonly")

ConstructCharacter (oCharacter)
ConstructCharacter (oCharacter2)

% GAME LOOP %

loop

    Music.PlayFileLoop ("Game.wav")
    Score := 0
    Score2 := 0
    Health := 100
    loop
	Pic.Draw (GameBGsize, 0, 0, picCopy)
	Font.Draw (intstr (Health), 558, 377, FontHP, white)
	Font.Draw (intstr (Score), 550, 350, Font3, white)
	Font.Draw (intstr (Score2), 550, 323, Font4, white)
	var Number := Rand.Int (0, 10)


	Input.KeyDown (chars)

	if Counter >= 30 then
	    Counter := 0

	    if Number <= 8 then
		new oAsteroid, upper (oAsteroid) + 1
		ConstructAsteroid (oAsteroid (upper (oAsteroid)))
	    end if
	end if
	for i : 1 .. upper (oAsteroid)
	    oAsteroid (i) -> Update
	end for



	if chars (KEY_RIGHT_ARROW) and oCharacter -> GetX < 590 then
	    oCharacter -> Update (Direction.Right)
	elsif chars (KEY_LEFT_ARROW) and oCharacter -> GetX > 0 then
	    oCharacter -> Update (Direction.Left)
	end if

	if chars ('d') and oCharacter2 -> GetX < 590 then
	    oCharacter2 -> Update (Direction.Right)
	elsif chars ('a') and oCharacter2 -> GetX > 0 then
	    oCharacter2 -> Update (Direction.Left)
	end if
	if chars ('w') then

	    if isExist = false then
		ConstructFire (oFire, oCharacter2 -> GetX)
		isExist := true
	    end if

	end if

	if chars (KEY_UP_ARROW) then

	    if isExist2 = false then
		ConstructFire (oFire2, oCharacter -> GetX)
		isExist2 := true
	    end if

	end if

	if isExist = true then
	    oFire -> Update
	    oFire -> DrawFire
	end if

	if isExist2 = true then
	    oFire2 -> Update
	    oFire2 -> DrawFire
	end if

	var number_to_remove : int := 0
	for i : 1 .. upper (oAsteroid)
	    if isExist = true then
		distance_between_centres := sqrt (((oFire -> GetX + 6) - (oAsteroid (i) -> GetX + 24)) ** 2 + ((oFire -> GetY + 8) - (oAsteroid (i) -> GetY + 24)) ** 2)
	    else
		distance_between_centres := 9000
	    end if

	    if isExist2 = true then
		distance_between_centres2 := sqrt (((oFire2 -> GetX + 6) - (oAsteroid (i) -> GetX + 24)) ** 2 + ((oFire2 -> GetY + 8) - (oAsteroid (i) -> GetY + 24)) ** 2)
	    else
		distance_between_centres2 := 9000
	    end if

	    oAsteroid (i) -> DrawAsteroid

	    if isExist2 = true and oFire2 -> GetY > 400 or distance_between_centres2 <= 6 + 24 then
		isExist2 := false
		DestructFire (oFire2)
	    end if

	    if isExist = true and oFire -> GetY > 400 or distance_between_centres <= 6 + 24 then
		isExist := false
		DestructFire (oFire)
	    end if

	    if oAsteroid (i) -> GetY < 35 then

		number_to_remove += 1
		for j : i .. upper (oAsteroid) - number_to_remove
		    oAsteroid (j) := oAsteroid (j + 1)
		end for
		Health := Health - 10

	    elsif distance_between_centres <= 6 + 24 then
		number_to_remove += 1
		for j : i .. upper (oAsteroid) - number_to_remove
		    oAsteroid (j) := oAsteroid (j + 1)
		end for
		Score := Score + 100

	    elsif distance_between_centres2 <= 6 + 24 then
		number_to_remove += 1
		for j : i .. upper (oAsteroid) - number_to_remove
		    oAsteroid (j) := oAsteroid (j + 1)
		end for
		Score2 := Score2 + 100

	    end if

	end for

	new oAsteroid, upper (oAsteroid) - number_to_remove


	for i : 1 .. upper (oAsteroid)

	end for

	oCharacter -> DrawCharacter
	oCharacter2 -> DrawCharacter2

	delay (25)
	View.Update
	Counter := Counter + 1
	cls

	exit when Health = 0
    end loop
    
    % END OF GAME %
    
    % END MENU% 
    
    Music.PlayFileStop
    cls
    Pic.Draw (EndBGSize, 0, 0, picCopy)
    View.Update
    Music.PlayFile ("EndSound.wav")
    Font.Draw (intstr (Score), 520, 130, Font1, white)
    Font.Draw (intstr (Score2), 520, 75, Font2, white)
    View.Update
    Music.PlayFile ("Coin.wav")

    loop
	Font.Draw (text, round (maxx / 2 - width / 2), 30, font, black)
	delay (500)
	View.Update
	Font.Draw (text, round (maxx / 2 - width / 2), 30, font, white)
	delay (500)
	View.Update
       Input.KeyDown (keys)
       exit when keys (KEY_SHIFT) 
    end loop

end loop






