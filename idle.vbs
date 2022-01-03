Dim objResult

Set objShell = WScript.CreateObject("WScript.Shell")    
i = 0

Do While i = 0
  objResult = objShell.sendkeys("{SCROLLLOCK}{SCROLLLOCK}")
  Wscript.Sleep (240000)
Loop