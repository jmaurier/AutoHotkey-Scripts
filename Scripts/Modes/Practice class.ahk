CurrentMode := 1

Class Mode extends ModeBase, GlobalMode
{
	__New(name, num)
	{
		This.ModeName := name
		This.ModeNUmber := num
	}

	printModeName()
	{
		thisName := This.ModeName
		GlobalMode.ToolTipInOut( thisName )
	}
}

Class ModeBase

{
	static ModeName
	static ModeNumber

	ExitCurrentMode()
	{
		global CurrentMode := 1
		;ToolTipInOut("Normal Mode")
		Return
	}
}


Class GlobalMode
{
	;--------------------------------------------------------------
	; Fields
	;--------------------------------------------------------------
	static isToolTipVisable = true

	;--------------------------------------------------------------
	; Methods
	;--------------------------------------------------------------
	ToolTipInOut(textValue)
	{
		if(%isToolTipVisable%)
		{
			ToolTip
			charTime    = 20
			pauseTime   = 500
			textLength := StrLen(textValue) 
			Loop, %textLength%
			{
				ToolTip % SubStr(textValue, 1, A_Index)
				Sleep, charTime
			}
			Sleep, pauseTime
			Loop, %textLength%
			{
				ToolTip % SubStr(textValue, A_Index, textLength - A_Index)
				Sleep, charTime
			}
			ToolTip
		}
		Return
	}
}

modeA := New Mode("newMode", 15)

#3::modeA.printModeName()