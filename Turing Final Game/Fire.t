class Fire 
export SetX, SetY, SetSpeed, GetX, GetY, Update, DrawFire  
var iX, iY, iSpeed, x : int 
var example : int := Pic.FileNew ("Fire.bmp") 

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

procedure DrawFire
Pic.Draw (example, iX, iY, picMerge)
end DrawFire

procedure Update 
SetY (GetY + GetSpeed) 
end Update 

end Fire 

type FireClass : pointer to Fire 

procedure ConstructFire (var oFire : FireClass , x : int)
new Fire, oFire 

setscreen ("graphics")
oFire -> SetX (x+25)
oFire -> SetY (35)
oFire -> SetSpeed (8) 
end ConstructFire 

procedure DestructFire (var oFire : FireClass) 
free oFire 
end DestructFire 

