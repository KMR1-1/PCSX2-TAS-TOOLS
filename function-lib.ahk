#MaxThreads 30
#MaxThreadsPerHotkey 30
#MaxMem 4095
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#SingleInstance, force
#include CvJoyInterface.ahk



;----------------   GLOBAL VARIABLES  ------------------
vJoyInterface := new CvJoyInterface() ;a class with all vjoy controls
if (!vJoyInterface.vJoyEnabled()){
	; Show log of what happened
	Msgbox % vJoyInterface.LoadLibraryLog
	ExitApp
}
	
myStick := vJoyInterface.Devices[1]
lastRX := 127
lastRY := 127
lastX := 127
lastY := 127
pi := 4*atan(1)


;---------------------------- GAME VARIABLES --------------------------

py := "0x2079405C"
px := "0x2079405C"
; thoes values can be found via cheat engine, very easly

frameaddress := BaseAddress() + 0x93129C 
; this address changes with pcsx2 versions
; in cheat engine it looks like "pcsx2.exe+0x93129C" just paste what you got
; the baseaddress function is that pcsx2.exe stuff, dunno if it changes with versions

;------------------  GENERAL FUNCTIONS  -------------
*::
{
Rall()
reload
return
}

frame(){
global frameaddress
winget, pid, PID, ahk_exe pcsx2.exe
VarSetCapacity(var,4,0)
ProcessHandle := DllCall("OpenProcess", "UInt", 0x0010|0x0020|0x0008, "Int", 0, "UInt", pid, "Ptr")
DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",frameaddress,"Str",var,"UInt",4,"UInt *",0)
return NumGet(var, 0, "UInt")
}

Rmem(MADDRESS) ;returns the value of an address from pcsx2
{
winget, pid, PID, ahk_exe pcsx2.exe ;get the id from pcsx2 process
hProcess := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", pid, "UInt") ;get your program process into a variable
VarSetCapacity(var, 4)
	DllCall("ReadProcessMemory", "UInt", hProcess, "Ptr", MADDRESS, "Ptr", &var, "UInt", 4, "Ptr", 0)
	Setformat, Float, 0.12 ;the number of digits
	return NumGet(var, 0, "Float") ;returns the float value of the adress inside the program memory
}

wf(x)
{
Loop %X%
{
Timer = 50
sleep Timer / 2
CFrame := frame()
Send {Space}
	sleep Timer * 2
Loop {
p2 := frame()
if (p2-CFrame=1)
	break
}
}
return
}

py() ;reads the value of xpos
{
global py
return Rmem(py)
}

px() ;value of ypos
{
global px
return Rmem(px)*(-1)
}

dta(x,y) ;returns the angle of the x y vector from 0 to 2pi
{
global pi
ang := atan(y/x)
if(x < 0 and y > 0){
		ang := ang + pi
	}
if(x < 0 and y < 0){
		ang := ang + pi
	}
if(x > 0 and y < 0){
		ang := ang  + 2*pi
}
return ang
}


;--------------------  PAD FUNCTIONS  ------------------------
RS(rx="",ry="")
{
global myStick
global vJoyInterface
global lastRX
global lastRY
if (RX = "")
	{
	RX = %lastRX%
	}
if (RY = "")
	{
	RY = %lastRY%
	}
lastRX = %RX%
lastRY = %RY%
myStick.SetAxisByName(RX*32768/255,"RX")
myStick.SetAxisByName(RY*32768/255,"RY")
return
}

LS(x="",y="")
{
global myStick
global vJoyInterface
global lastX
global lastY
if (x = "")
	{
	x = %lastX%
	}
if (y = "")
	{
	y = %lastY%
	}
lastX = %X%
lastY = %Y%
myStick.SetAxisByName(x*32768/255,"x")
myStick.SetAxisByName(Y*32768/255,"Y")
return
}


PressBtn(b)
{
global myStick
global frameaddress
a = Rmem(frameaddress)
myStick.SetBtn(1,b)
wf(1)
while (Rmem(frameaddress) = a)
{
}
myStick.SetBtn(0,b)
return
}

Cross()
{
PressBtn(1)
return
}
Square()
{
PressBtn(2)
return
}
Circle()
{
PressBtn(3)
return
}
Triangle()
{
PressBtn(4)
return
}
DUp()
{
PressBtn(5)
return
}
DDown()
{
PressBtn(6)
return
}
DLeft()
{
PressBtn(7)
return
}
DRight()
{
PressBtn(8)
return
}
R1()
{
PressBtn(9)
return
}
R2()
{
PressBtn(10)
return
}
R3()
{
PressBtn(11)
return
}
L1()
{
PressBtn(12)
return
}
L2()
{
PressBtn(13)
return
}
L3()
{
PressBtn(14)
return
}
Select()
{
PressBtn(15)
return
}
Start()
{
PressBtn(16)
return
}


HCross()
{
global myStick
myStick.SetBtn(1,1)
return
}
RCross()
{
global myStick
myStick.SetBtn(0,1)
return
}
HSquare()
{
global myStick
myStick.SetBtn(1,2)
return
}
RSquare()
{
global myStick
myStick.SetBtn(0,2)
return
}
HCircle()
{
global myStick
myStick.SetBtn(1,3)
return
}
RCircle()
{
global myStick
myStick.SetBtn(0,3)
return
}
HTriangle()
{
global myStick
myStick.SetBtn(1,4)
return
}
RTriangle()
{
global myStick
myStick.SetBtn(0,4)
return
}
HDUp()
{
global myStick
myStick.SetBtn(1,5)
return
}
RDUp()
{
global myStick
myStick.SetBtn(0,5)
return
}
HDDown()
{
global myStick
myStick.SetBtn(1,6)
return
}
RDDown()
{
global myStick
myStick.SetBtn(0,6)
return
}
HDLeft()
{
global myStick
myStick.SetBtn(1,7)
return
}
RDLeft()
{
global myStick
myStick.SetBtn(0,7)
return
}
HDRight()
{
global myStick
myStick.SetBtn(1,8)
return
}
RDRight()
{
global myStick
myStick.SetBtn(0,8)
return
}
HR1()
{
global myStick
myStick.SetBtn(1,9)
return
}
RR1()
{
global myStick
myStick.SetBtn(0,9)
return
}
HR2()
{
global myStick
myStick.SetBtn(1,10)
return
}
RR2()
{
global myStick
myStick.SetBtn(0,10)
return
}
HR3()
{
global myStick
myStick.SetBtn(1,11)
return
}
RR3()
{
global myStick
myStick.SetBtn(0,11)
return
}
HL1()
{
global myStick
myStick.SetBtn(1,12)
return
}
RL1()
{
global myStick
myStick.SetBtn(0,12)
return
}
HL2()
{
global myStick
myStick.SetBtn(1,13)
return
}
RL2()
{
global myStick
myStick.SetBtn(0,13)
return
}
HL3()
{
global myStick
myStick.SetBtn(1,14)
return
}
RL3()
{
global myStick
myStick.SetBtn(0,14)
return
}
HSelect()
{
global myStick
myStick.SetBtn(1,15)
return
}
RSelect()
{
global myStick
myStick.SetBtn(0,15)
return
}
HStart()
{
global myStick
myStick.SetBtn(1,16)
return
}
RStart()
{
global myStick
myStick.SetBtn(0,16)
return
}

RDPad()
{
RDLeft()
RDRight()
RDUp()
RDDown()
return
}

Rall()
{
RCircle()
RCross()
RDDown()
RDLeft()
RDRight()
RDUp()
RL1()
RL2()
RL3()
RR1()
RR2()
RR3()
RSelect()
RStart()
RTriangle()
RSquare()
LS(127,127)
RS(127,127)
return
}



;--------------------------------  OTHER  -----------------------------
BaseAddress(windowMatchMode := "3")    ;WindowTitle can be anything ahk_exe ahk_class etc
{
    if (windowMatchMode && A_TitleMatchMode != windowMatchMode)
    {
        mode := A_TitleMatchMode ; This is a string and will not contain the 0x prefix
        StringReplace, windowMatchMode, windowMatchMode, 0x ; remove hex prefix as SetTitleMatchMode will throw a run time error. This will occur if integer mode is set to hex and matchmode param is passed as an number not a string.
        SetTitleMatchMode, %windowMatchMode%    ;mode 3 is an exact match
    }
    WinGet, hWnd, ID, ahk_exe pcsx2.exe
    if mode
        SetTitleMatchMode, %mode%    ; In case executed in autoexec
    if !hWnd
        return ; return blank failed to find window
    else return DllCall( A_PtrSize = 4
                        	? "GetWindowLong"
                        	: "GetWindowLongPtr"
                        , "Ptr", hWnd
                        , "Int", -6
                        , "Int64") ; Use Int64 to prevent negative overflow when AHK is 32 bit and target process is 64bit
     ; If DLL call fails, returned value will = 0
}