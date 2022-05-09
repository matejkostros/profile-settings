#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its sLEFTerior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; AHK Command       ; key   = Effect        (Description)

; ALT Keypress Implied for all below

!h::Send {LEFT}     ; h LEFT          (Cursor LEFT line)
!j::Send {DOWN}     ; k DOWN            (Cursor DOWN line)

!k::Send {UP}       ; j UP        (Cursor UP one character)
!l::Send {RIGHT}    ; l RIGHT       (Cursor RIGHT one character)

!u::Send {HOME}     ; a     ALT + RIGHT (Cursor to beginning of line)
!o::Send {END}      ; ; ALT + UP  (Cursor to end of line)

!y::Send {PgUp}     ; a     SHIFT + HOME    (Cursor to beginning of document)
!p::Send {PgDn}     ; o SHIFT + END (Cursor to end of document)
!i::Send +{Ins}     ; i > SHIFT + Insert (Clear paste)
!x::Send {Del}      ; x > Delete

; CTRL + ALT Keypress Implied for all below

!^k::Send {UP}      ; k UP       (Cursor UP per word)
!^l::Send ^{RIGHT}  ; l CTRL + RIGHT    (Cursor RIGHT per word)
!^h::Send ^{LEFT}   ; h CTRL + LEFT       (Cursor LEFT per word)
!^j::Send {DOWN}    ; j DOWN    (Cursor DOWN per word)
!^i::Send ^+{v}     ; v CTRL + v (formated paste)

; SHIFT + ALT Keypress Implied for all below

!+h::Send +{LEFT}   ; h SHIFT + LEFT  (Highlight per line)
!+j::Send +{DOWN}   ; k SHIFT + DOWN    (Highlight per line)

!+k::Send +{UP}     ; j SHIFT + UP    (Highlight per character)
!+l::Send +{RIGHT}  ; l SHIFT + RIGHT   (Highlight per character)

!+u::Send +{HOME}   ; h SHIFT + ALT + UP  (Highlight to beginning of line)
!+o::Send +{END}    ; ; SHIFT + ALT + RIGHT (Hightlight to end of line)

!+y::Send ^+{HOME}  ; a SHIFT + CTRL + HOME (Highlight to beggininng of document)
!+p::Send ^+{END}   ; o SHIFT + CTRL + END  (Hightlight to end of document)

; SHIFT + CTRL + ALT Keypress Implied for all below

!+^k::Send +^{UP}   ; j SHIFT + CTRL + UP (Highlight per word)
!+^l::Send +^{RIGHT}; l SHIFT + CTRL + RIGHT    (Hightlight per word)

!+^h::Send +^{LEFT} ; h SHIFT + ALT + LEFT    (Multiply cursor LEFT)
!+^j::Send +^{DOWN} ; k SHIFT + ALT + DOWN  (Multiply cursor DOWN)

; CTRL + SHIFT Keypress Implied for all below

+^h::Send +^{LEFT}
+^j::Send +^{DOWN}
+^k::Send +^{UP}
+^l::Send +^{RIGHT}
