class Asteroid 
export SetX, SetY, SetSpeed, GetX, GetY, Update, DrawAsteroid 
var iX, iY, iSpeed : int 
var X := Rand.Int (10, 20)
var AsteroidPic : int := Pic.FileNew ("Asteroid1.bmp")

function GetX : int 
result iX 
end GetX

function GetY :int 
result iY
end GetY 

procedure SetX (ipX : int)
iX := ipX
end SetX 

procedure SetY (ipY : int)
iY := ipY
end SetY 

procedure SetSpeed (ipSpeed : int) 
iSpeed := ipSpeed 
end SetSpeed 

function GetSpeed : int 
result iSpeed
end GetSpeed 

procedure DrawAsteroid
Pic.Draw (AsteroidPic, iX, iY, picMerge)
end DrawAsteroid

procedure Update 
SetY (GetY - GetSpeed) 
end Update 

end Asteroid 

type AsteroidClass : pointer to Asteroid 

procedure ConstructAsteroid (var oAsteroid : AsteroidClass)
new Asteroid, oAsteroid 
setscreen ("graphics")

var X := Rand.Int (10, 580)
oAsteroid -> SetX (X)
oAsteroid -> SetY (410)
oAsteroid -> SetSpeed (4) 
end ConstructAsteroid  

procedure DestructAsteroid (var oAsteroid : AsteroidClass) 
free oAsteroid
end DestructAsteroid
