#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#include function-lib.ahk

; --------------------- functions :
; frame() return frame value (change the address into lib.ahk)
; px() return xpos (change the address into lib.ahk)
; py() return ypos (change the address into lib.ahk)
; dta(x,y) returns the angle of the x y vector
; Rmem(0x00000000) return value of an address
; wf(x) wait x amount of frames (change the address into lib.ahk)
; $ key to test a frame
; * key to reload the script after a change and release all Buttons

;---------------------- stick :
; LS(y,x) maintain leftstick coordinates
; RS(y,x) maintain rightstick coordinates
; from 0 to 255
; y=0:down y=255:up x=0:left x=255:right
; neutral pos is 127,127

;----------------------- button
; hold button, frame advance, release button:
; Cross(), Square(), Circle(), Triangle()
; DUp(), DDown(), DRight(), DLeft
; R1(), L1(), R2(), L2(), R3(), L3()
; Start(), Select()

; to hold down a button only
; just write H in front of the button function (not working on stick)
; ex: HCross() or HDDown  (doesn't frameadvance, just hold down until release)
;
; to release just write R in front of the button function
; ex: RStart() or RR3()
; Rall() release everything and stick coord gets to neutral 127,127
; RDPad() release DPad

Insert::
{
seg0()
;seg1()
;wf(5)
;seg2()
;seg3()
return
}


seg0()
{
;framestart at 1400 slot 0
;press start 2458
;first input 2564

;example
LS(255,127) ;sets the stick
wf(2) ;frame advance twice
Cross() ;press cross and frameadvance and release cross
LS(255,174) ;change direction
wf(2) ;frame advance twice

return
}

seg1()
{

return
}

seg2()
{

return
}

seg3()
{

return
}


$:: ;test direction precision function
{
;be sure to be on the first frame of your saveslot
X := -314.838897705078
Y := 481.981994628906
;coordinates to aim

lx := 127
ly := 255
;stick position

posx := px()
posy := py()
dx := X-posx
dy := Y-posy
;calculate the x and y distance between your character's pos and the point you're aiming

LS(ly,lx)
wf(1)
;mooves your character

dx2 := px()-posx
dy2 := py()-posy
;calculates the x and y distance parcoured by your character

speed := sqrt(dy2*dy2+dx2*dx2)
angdif := dta(dx,dy)-dta(dx2,dy2)
;calculate the angle difference between where you should go and where you went

sleep, 200
Send, {F3}
sleep, 200
;reload your savestate

msgbox, 
(
diff: 
%angdif%

speed: 
%speed%

dx: %dx2%
dy: %dy2%
)
;displays all the info you collected in a msg box
return
}


