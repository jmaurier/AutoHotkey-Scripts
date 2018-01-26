#g::
{
  	clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
  	Run, http://www.google.com/search?q=%clipboard%
  	Clipboard := clipBoardTemp
  	Return
}

;Define the text under the cursor
#?::
{
    clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
    Run, http://www.google.com/search?q=define+%clipboard%
    Clipboard := clipBoardTemp
    Return
}