type Direction : enum (Left, Right)


class Character
    import Direction
    export SetX, SetY, SetSpeed, GetX, GetY, Update, DrawCharacter, DrawCharacter2
    var wizard : int := Pic.FileNew ("wizardL.bmp")
    var wizard1 : int := Pic.FileNew ("wizard1L.bmp")
    var iX, iY, iSpeed : int

    function GetX : int
	result iX
    end GetX

    function GetY : int
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

    procedure DrawCharacter
	Pic.Draw (wizard, iX, iY, picMerge)
    end DrawCharacter

    procedure DrawCharacter2
	Pic.Draw (wizard1, iX, iY, picMerge)
    end DrawCharacter2

    procedure Update (pDirection : Direction)
	case pDirection of
	    label Direction.Left :
		Pic.Free (wizard)
		Pic.Free (wizard1)
		wizard := Pic.FileNew ("wizardL.bmp")
		wizard1 := Pic.FileNew ("wizard1L.bmp")
		SetX (GetX - GetSpeed)
	    label Direction.Right :
		Pic.Free (wizard)
		Pic.Free (wizard1)
		wizard := Pic.FileNew ("wizardR.bmp")
		wizard1 := Pic.FileNew ("wizard1R.bmp")
		SetX (GetX + GetSpeed)
	end case
    end Update

end Character

type CharacterClass : pointer to Character
procedure ConstructCharacter (var oCharacter : CharacterClass)
    new Character, oCharacter

    setscreen ("graphics")
    oCharacter -> SetX (320)
    oCharacter -> SetY (35)
    oCharacter -> SetSpeed (7)
end ConstructCharacter

procedure DestructCharacter (var oCharacter : CharacterClass)
    free oCharacter
end DestructCharacter


