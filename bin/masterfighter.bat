:: What to do?
:: Add "Shock" Item (SHK)
:: Finish Johnny fight (shadow forms)

@echo off
title Master Fighter
color a
set /a dev=0
set /a falsepositive=0
set /a simplify=0
set /a cheat=0
set /a screen=1
set /a statson=0
if EXIST "%cd%\data\working.data" set /a statson=1
if %screen%==1 (
set /a x=120
set /a y=30
set /a prevx=120
set /a prevy=30
)
if %screen%==0 (
set /a x=80
set /a y=25
set /a prevx=80
set /a prevy=25
)
if %statson%==0 mode %x%,%y%
if %statson%==0 goto Welcome
for /f %%a in (data/screen.data) do (
set /a screen=%%a
)
for /f %%a in (data/x.data) do (
set /a x=%%a
)
if %screen%==0 if %x% LSS 80 set /a x=80
if %screen%==1 if %x% LSS 120 set /a x=120
for /f %%a in (data/y.data) do (
set /a y=%%a
)
if %screen%==0 if %y% LSS 25 set /a y=25
if %screen%==1 if %y% LSS 30 set /a y=30
if %statson%==1 echo %x% > "%cd%\data\x.data"
if %statson%==1 echo %y% > "%cd%\data\y.data"
mode %x%,%y%

:Welcome
:: Simply welcomes you to the game (I put this in all my games)
if EXIST "%cd%\data\working.data" nircmd.exe killprocess wscript.exe
cls
echo Welcome to Master Fighter V. 1.3.0 ALPHA!
echo Created By David Cannon
pause
goto StatsCheck

:StatsCheck
:: Checks if your computer can successfully get to the data folder
set /a statson=1
if not EXIST "%cd%\data\working.data" set /a statson=0
goto StatsOff

:StatsOption
set /a option=0
cls
echo Would you like to enable saved data?
echo (If the game keeps crashing or getting Error1B turn this off)
echo Say "On", "Off", or "Auto"
set /p option=
if /i "%option%"=="On" goto StatsOn
if %statson%==1 if /i "%option%"=="Off" (
set /a statson=0
goto Menu
)
if /i "%option%"=="Off" goto StatsOff
if /i "%option%"=="Auto" goto StatsCheck
echo That wasnt a option
pause
goto StatsOption

:StatsOn
:: Gives default save data just incase anything fails to load (Gets redirected from StatsOff)
::Creates files that don't exist
if not EXIST "%cd%\data\" md "%cd%\data\"
if not EXIST "%cd%\data\lvl.data" echo 1 > "%cd%\data\lvl.data"
if not EXIST "%cd%\data\xp.data" echo 0 > "%cd%\data\xp.data"
if not EXIST "%cd%\data\p.data" echo 0 > "%cd%\data\p.data"
if not EXIST "%cd%\data\ko.data" echo 0 > "%cd%\data\ko.data"
if not EXIST "%cd%\data\q.data" echo 0 > "%cd%\data\q.data"
if not EXIST "%cd%\data\td.data" echo 0 > "%cd%\data\td.data"
if not EXIST "%cd%\data\tw.data" echo 0 > "%cd%\data\tw.data"
if not EXIST "%cd%\data\working.data" echo 0 > "%cd%\data\working.data"
if not EXIST "%cd%\data\hl.data" echo 1 > "%cd%\data\hl.data"
if not EXIST "%cd%\data\dl.data" echo 1 > "%cd%\data\dl.data"
if not EXIST "%cd%\data\sl.data" echo 1 > "%cd%\data\sl.data"
if not EXIST "%cd%\data\mn.data" echo 0 > "%cd%\data\mn.data"
if not EXIST "%cd%\data\mute.data" echo 0 > "%cd%\data\mute.data"
if not EXIST "%cd%\data\crash.data" echo 0 > "%cd%\data\crash.data"
if not EXIST "%cd%\data\screen.data" echo 1 > "%cd%\data\screen.data"
if not EXIST "%cd%\data\tut.data" echo 0 > "%cd%\data\tut.data"
if not EXIST "%cd%\data\tstg.data" echo 0 > "%cd%\data\tstg.data"
if not EXIST "%cd%\data\inv\" md "%cd%\data\inv\"
if not EXIST "%cd%\data\inv\stk.data" echo 0 > "%cd%\data\inv\stk.data"
if not EXIST "%cd%\data\inv\clts.data" echo 0 > "%cd%\data\inv\clts.data"
if not EXIST "%cd%\data\inv\wbt.data" echo 0 > "%cd%\data\inv\wbt.data"
if not EXIST "%cd%\data\inv\knf.data" echo 0 > "%cd%\data\inv\knf.data" 
if not EXIST "%cd%\data\inv\grd.data" echo 0 > "%cd%\data\inv\grd.data" 
if not EXIST "%cd%\data\inv\grm.data" echo 0 > "%cd%\data\inv\grm.data" 
if not EXIST "%cd%\data\inv\tsr.data" echo 0 > "%cd%\data\inv\tsr.data" 
if not EXIST "%cd%\data\inv\ic.data" echo 0 > "%cd%\data\inv\ic.data" 
if not EXIST "%cd%\data\inv\mnhl.data" echo 0 > "%cd%\data\inv\mnhl.data"
if not EXIST "%cd%\data\inv\avhl.data" echo 0 > "%cd%\data\inv\avhl.data"
if not EXIST "%cd%\data\inv\mjhl.data" echo 0 > "%cd%\data\inv\mjhl.data"
if not EXIST "%cd%\data\inv\rndmhl.data" echo 0 > "%cd%\data\inv\rndmhl.data"
if not EXIST "%cd%\data\inv\xhw.data" echo 0 > "%cd%\data\inv\xhw.data"
if not EXIST "%cd%\data\inv\chnb.data" echo 0 > "%cd%\data\inv\chnb.data"
if not EXIST "%cd%\data\inv\shtr.data" echo 0 > "%cd%\data\inv\shtr.data"
if not EXIST "%cd%\data\inv\bdg.data" echo 0 > "%cd%\data\inv\bdg.data"
if not EXIST "%cd%\data\inv\btl.data" echo 0 > "%cd%\data\inv\btl.data"
if %falsepositive%==0 if not EXIST "%cd%\data\lvl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\xp.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\p.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\ko.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\q.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\td.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\tw.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\working.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\hl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\dl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\sl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\mn.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\mute.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\crash.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\screen.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\tut.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\tstg.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\stk.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\clts.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\wbt.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\knf.data" goto Error1B 
if %falsepositive%==0 if not EXIST "%cd%\data\inv\grd.data" goto Error1B 
if %falsepositive%==0 if not EXIST "%cd%\data\inv\tsr.data" goto Error1B 
if %falsepositive%==0 if not EXIST "%cd%\data\inv\grm.data" goto Error1B 
if %falsepositive%==0 if not EXIST "%cd%\data\inv\ic.data" goto Error1B 
if %falsepositive%==0 if not EXIST "%cd%\data\inv\mnhl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\avhl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\mjhl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\rndmhl.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\xhw.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\chnb.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\shtr.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\bdg.data" goto Error1B
if %falsepositive%==0 if not EXIST "%cd%\data\inv\btl.data" goto Error1B 
:: Loads saved files
for /f %%a in (data/crash.data) do (
set /a crash=%%a
)
if %crash%==1 goto Crashed
set /a crash=1
echo 1 > "%cd%\data\crash.data"
for /f %%a in (data/working.data) do (
set /a cheat=%%a
)
if %cheat% GEQ 3 goto Banned
for /f %%a in (data/lvl.data) do (
set /a level=%%a
)
for /f %%a in (data/xp.data) do (
set /a xp=%%a
)
for /f %%a in (data/p.data) do (
set /a points=%%a
)
for /f %%a in (data/ko.data) do (
set /a ko=%%a
)
for /f %%a in (data/q.data) do (
set /a quit=%%a
)
for /f %%a in (data/td.data) do (
set /a totaldefeats=%%a
)
for /f %%a in (data/tw.data) do (
set /a totalwins=%%a
)
for /f %%a in (data/hl.data) do (
set /a healthlevel=%%a
)
for /f %%a in (data/dl.data) do (
set /a damagelevel=%%a
)
for /f %%a in (data/mn.data) do (
set /a money=%%a
)
for /f %%a in (data/tut.data) do (
set /a tutorial=%%a
)
for /f %%a in (data/tstg.data) do (
set /a tstage=%%a
)
for /f %%a in (data/inv/stk.data) do (
set /a wpnitemstick=%%a
)
for /f %%a in (data/inv/clts.data) do (
set /a wpnitemcleats=%%a
)
for /f %%a in (data/inv/wbt.data) do (
set /a wpnitembat=%%a
)
for /f %%a in (data/inv/knf.data) do ( 
set /a wpnitemknife=%%a 
) 
for /f %%a in (data/inv/grd.data) do ( 
set /a dmgitemgrenade=%%a 
) 
for /f %%a in (data/inv/grm.data) do ( 
set /a dmgitemgrim=%%a 
) 
for /f %%a in (data/inv/tsr.data) do ( 
set /a dmgitemtaser=%%a 
) 
for /f %%a in (data/inv/btl.data) do ( 
set /a dmgitembottle=%%a 
) 
for /f %%a in (data/inv/ic.data) do (
set /a dmgitemice=%%a
) 
for /f %%a in (data/inv/mnhl.data) do (
set /a healthitemmh=%%a
)
for /f %%a in (data/inv/avhl.data) do (
set /a healthitemah=%%a
)
for /f %%a in (data/inv/mjhl.data) do (
set /a healthitemmajorheal=%%a
)
for /f %%a in (data/inv/rndmhl.data) do (
set /a healthitemrandomheal=%%a
)
for /f %%a in (data/inv/bdg.data) do ( 
set /a healthitembandage=%%a 
) 
for /f %%a in (data/inv/xhw.data) do (
set /a xpitemhandwraps=%%a
)
for /f %%a in (data/inv/chnb.data) do (
set /a xpitemchmpnb=%%a
)
for /f %%a in (data/inv/shtr.data) do (
set /a otheritemshatter=%%a
)
if EXIST "%cd%\data\pet\pjke.data8432" for /f %%a in (data/pet/pjke.data8432) do (
set /a petjake=%%a
)
if EXIST "%cd%\data\pet\ptfu.data9212" for /f %%a in (data/pet/ptfu.data9212) do (
set /a pettofu=%%a
)
if EXIST "%cd%\data\pet\pbki.data5392" for /f %%a in (data/pet/pbki.data5392) do (
set /a petbiki=%%a
)
if EXIST "%cd%\data\pet\pgbl.data1135" for /f %%a in (data/pet/pgbl.data1135) do (
set /a petgobble=%%a
)
if EXIST "%cd%\data\pet\pcar.data0666" for /f %%a in (data/pet/pcar.data0666) do (
set /a petcarius=%%a
)
for /f %%a in (data/sl.data) do (
set /a speedlevel=%%a
)
for /f %%a in (data/mute.data) do (
set /a mute=%%a
)
for /f %%a in (data/screen.data) do (
set /a screen=%%a
)
set /a lsplash=0
set /a nlvlxp=100+((%level%-1)*75)+((%level%/5)*75)
set /a customload=0
if %ko%==1 goto Defeated3
if %quit%==1 goto Quitter
goto Menu

:StatsOff
:: Gives default save data
set /a lsplash=0
set /a speedlevel=1
set /a damagelevel=1
set /a healthlevel=1
set /a shadowlevel=0
set /a level=1
set /a nlvlxp=100+((%level%-1)*75)+((%level%/5)*75)
set /a xp=0
set /a points=0
set /a quit=0
set /a totaldefeats=0
set /a totalwins=0
set /a mute=1
set /a screen=1
set /a money=0
set /a tutorial=0
set /a wpnitemstick=0
set /a wpnitemcleats=0
set /a wpnitembat=0
set /a wpnitemknife=0
set /a dmgitemgrenade=0
set /a dmgitemgrim=0
set /a dmgitemtaser=0
set /a dmgitembottle=0
set /a dmgitemice=0
set /a healthitemmh=0
set /a healthitemah=0
set /a healthitemmajorheal=0
set /a healthitemrandomheal=0
set /a healthitembandage=0
set /a xpitemhandwraps=0
set /a xpitemchmpnb=0
set /a otheritemshatter=0
set /a petjake=0
set /a pettofu=0
set /a petbiki=0
set /a petgobble=0
set /a petcarius=0
set /a losestreak=0
set /a tstage=0
set /a customload=0
set /a gamemode=0
set /a itemmenu=0
if %statson%==1 goto StatsOn
goto Menu

:Menu
if %mute%==0 nircmd.exe killprocess wscript.exe
set /a crash=0
if %statson%==1 echo 0 > "%cd%\data\crash.data"
if %tutorial%==0 goto Tutorial
cls
set /a maxlevel=20
if %cheat% GEQ 3 goto Banned
set /a ctest=(%healthlevel%+%speedlevel%+%damagelevel%)-3
if %totaldefeats%==0 set /a kdrf=%totaldefeats%+1
if %totaldefeats%==0 set /a ctest1=%totalwins%/%kdrf%
if %totaldefeats% GEQ 1 set /a ctest1=%totalwins%/%totaldefeats%
if %healthlevel%==1 set /a ctest21=0+((%speedlevel%-1)*2)
if %healthlevel%==2 set /a ctest21=1+((%speedlevel%-1)*2)
if %healthlevel%==3 set /a ctest21=3+((%speedlevel%-1)*2)
if %healthlevel%==4 set /a ctest21=5+((%speedlevel%-1)*2)
if %healthlevel%==5 set /a ctest21=7+((%speedlevel%-1)*2)
if %healthlevel%==6 set /a ctest21=9+((%speedlevel%-1)*2)
if %damagelevel%==1 set /a ctest2=(%ctest21%+(0)+%points%)+1
if %damagelevel%==2 set /a ctest2=(%ctest21%+(1)+%points%)+1
if %damagelevel%==3 set /a ctest2=(%ctest21%+(3)+%points%)+1
if %damagelevel%==4 set /a ctest2=(%ctest21%+(6)+%points%)+1
set /a ctest3=%nlvlxp%*4
if %ctest% GEQ %level% goto Cheater
if %ctest1% GEQ 5000 goto Cheater
if NOT %ctest2%==%level% goto Cheater
if %level% GTR %maxlevel% goto Cheater
if %healthlevel% GTR %level% goto Cheater
if %damagelevel% GTR %level% goto Cheater
if %speedlevel% GTR %level% goto Cheater
if %healthlevel% GEQ 7 goto Cheater
if %damagelevel% GEQ 5 goto Cheater
if %speedlevel% GTR 3 goto Cheater
if %points% GEQ %level% goto Cheater
if %xp% GEQ %ctest3% goto Cheater
:: All of this is the anticheat ^^
set /a icr=1
set /a icr2=0
goto ItemCheck
:ItemCheck
set /a hasitems=0
set /a haswpnitems=0
set /a hasdmgitems=0
set /a hashealthitems=0
set /a hasxpitems=0
set /a hasotheritems=0
if %wpnitemstick% GTR 0 set /a haswpnitems=%haswpnitems%+%wpnitemstick%
if %wpnitemcleats% GTR 0 set /a haswpnitems=%haswpnitems%+%wpnitemcleats%
if %wpnitembat% GTR 0 set /a haswpnitems=%haswpnitems%+%wpnitembat%
if %wpnitemknife% GTR 0 set /a haswpnitems=%haswpnitems%+%wpnitemknife%
if %dmgitemgrenade% GTR 0 set /a hasdmgitems=%hasdmgitems%+%dmgitemgrenade%
if %dmgitemgrim% GTR 0 set /a hasdmgitems=%hasdmgitems%+%dmgitemgrim%
if %dmgitemtaser% GTR 0 set /a hasdmgitems=%hasdmgitems%+%dmgitemtaser%
if %dmgitembottle% GTR 0 set /a hasdmgitems=%hasdmgitems%+%dmgitembottle%
if %dmgitemice% GTR 0 set /a hasdmgitems=%hasdmgitems%+%dmgitemice% 
if %healthitemmh% GTR 0 set /a hashealthitems=%hashealthitems%+%healthitemmh%
if %healthitemah% GTR 0 set /a hashealthitems=%hashealthitems%+%healthitemah%
if %healthitemmajorheal% GTR 0 set /a hashealthitems=%hashealthitems%+%healthitemmajorheal%
if %healthitemrandomheal% GTR 0 set /a hashealthitems=%hashealthitems%+%healthitemrandomheal%
if %healthitembandage% GTR 0 set /a hashealthitems=%hashealthitems%+%healthitembandage%
if %xpitemhandwraps% GTR 0 set /a hasxpitems=%hasxpitems%+%xpitemhandwraps%
if %xpitemchmpnb% GTR 0 set /a hasxpitems=%hasxpitems%+%xpitemchmpnb%
if %otheritemshatter% GTR 0 set /a hasotheritems=%hasotheritems%+%otheritemshatter%
set /a hasitems=%haswpnitems%+%hasdmgitems%+%hashealthitems%+%hasxpitems%+%hasotheritems%
set /a haspets=%petjake%+%pettofu%+%petbiki%+%petgobble%+%petcarius%
if %itemmenu%==6 goto Game
if %icr%==1 goto Menu2
if %icr%==2 goto GameItems
if %icr%==3 goto Game
goto Error1A
:Menu2

mode %x%,%y%
if %xp% LSS 0 set /a xp=0
if %statson%==1 if %xp%==0 echo 0 > "%cd%\data\xp.data"
if %xp% GEQ %nlvlxp% goto LevelUp
set /a splash=%random%*10/32767+1
if %lsplash%==%splash% goto Menu
set /a lsplash=%splash%
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                            Master Fighter Main Menu                            
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                Master Fighter Main Menu                                                 
if %screen%==1 echo ========================================================================================================================
if %splash%==1 echo Fight!
if %splash%==2 echo Speed!
if %splash%==3 echo Strength!
if %splash%==4 echo Gotta be the strongest!
if %splash%==5 echo Don't give up!
if %splash%==6 echo Power Up!
if %splash%==7 echo You better knock them out or you better not come out!
if %splash%==8 echo Stand up and fight!
if %splash%==9 echo Give it your all!
if %splash%==10 echo Revenge!
if %screen%==0 echo =====================================Stats=====================================
if %screen%==1 echo ==========================================================Stats=========================================================
if %simplify%==1 echo Level: %level% (XP: %xp%)
if %simplify%==0 echo Level: %level%
if %simplify%==0 echo XP: %xp%
echo Money: $%money%
if %healthlevel% LSS 6 echo Health Level: %healthlevel%
if %healthlevel%==6 echo Health Level: %healthlevel% (MAX)
if %damagelevel% LSS 4 echo Damage Level: %damagelevel%
if %damagelevel%==4 echo Damage Level: %damagelevel% (MAX)
if %speedlevel% LSS 3 echo Speed Level: %speedlevel%
if %speedlevel%==3 echo Speed Level: 3 (MAX)
if %totalwins%==1 echo You have won %totalwins% match
if %totalwins% GEQ 2 echo You have won %totalwins% matches
if %totaldefeats%==1 echo You have lost %totaldefeats% match
if %totaldefeats% GEQ 2 echo You have lost %totaldefeats% matches
if %points% GTR 0 echo Skill Points Avaliable: %points%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %simplify%==1 if %points% GTR 0 echo "Start" Game / Open "Shop" / View "Inventory" / Check "Level" / View "Settings" / Use "Points"
if %simplify%==1 if %points%==0 echo "Start" Game / Open "Shop" / View "Inventory" / Check "Level" / View "Settings"
if %simplify%==0 echo Say "Start" to start playing the game
if %level% GEQ 10 echo Say "Tournament" to go to the '2019 Master fighter Tournament'
if %money% GTR 0 if %simplify%==0 echo Say "Shop" to check out the shop
if %haspets% GTR 0 echo Say "Pets" to view all yours pets
if %simplify%==0 if %hasitems% GEQ 1 echo Say "Inventory" to check your inventory
if %simplify%==0 echo Say "Level" to check your level status
if %simplify%==0 if %points% GTR 0 echo Say "Points" to spend your skill points
if %simplify%==0 echo Say "Settings" to see all the games settings
set /p select=
if /i "%select%"=="Start" goto LoadEClass
if /i "%select%"=="1" goto LoadEClass
if %level% GEQ 10 if /i "%select%"=="Tournament" goto TournamentMenu
if %level% GEQ 10 if /i "%select%"=="2" goto TournamentMenu
if %haspets% GTR 0 if /i "%select%"=="Pets" goto Pets
if /i "%select%"=="Shop" goto Shop
if %hasitems% GEQ 1 if /i "%select%"=="Inventory" goto Inventory
if %hasitems% GEQ 1 if /i "%select%"=="Inv" goto Inventory
if /i "%select%"=="Options" goto Settings
if /i "%select%"=="Settings" goto Settings
if /i "%select%"=="Level" goto Level
if /i "%select%"=="tutorial" goto Tutorial
if %points% GTR 0 if /i "%select%"=="Points" goto Points
if "%select%"=="Dev" set /a dev=1
if %dev%==1 (
if /i "%select%"=="Dev" echo Dev Mode is Active
if /i "%select%"=="DevStart" goto CPUDevClass
if "%select%"=="DEVCONSOLE" goto DevConsoleCode
if "%select%"=="DevRejoin" goto DevRejoin
if "%select%"=="DebugMarax" goto BossMaraxLoad
)
echo "%select%" isnt a option, try again!
timeout 5 > nul
if %statson%==1 goto StatsOn
goto Menu

:DevRejoin
set /a health=1000
goto Game

:DevConsoleCode
cls
set /p pass=
cls
echo Access Granted!
if %pass%==LETMEIN goto DevConsole
exit

:DevConsole
set /p command=
%command%
goto DevConsole

:Inventory
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==0 echo                                   Inventory                                   
if %screen%==1 echo                                                        Inventory                                                        
if %screen%==0 if %hasdmgitems% GEQ 1 echo =================================Damage Items==================================
if %screen%==1 if %hasdmgitems% GEQ 1 echo ======================================================Damage Items======================================================
if %dmgitemgrenade% GTR 0 echo Grenade (x%dmgitemgrenade%)
if %dmgitemtaser% GTR 0 echo Taser (x%dmgitemtaser%)
if %dmgitembottle% GTR 0 echo Bottle (x%dmgitembottle%) 
if %dmgitemgrim% GTR 0 echo Grim (x%dmgitemgrim%)
if %dmgitemice% GTR 0 echo Ice (x%dmgitemice%) 
if %screen%==0 if %haswpnitems% GEQ 1 echo =================================Weapon Items==================================
if %screen%==1 if %haswpnitems% GEQ 1 echo ======================================================Weapon Items======================================================
if %wpnitemstick% GTR 0 echo Stick (x%wpnitemstick%)
if %wpnitemcleats% GTR 0 echo Cleats (x%wpnitemcleats%)
if %wpnitemknife% GTR 0 echo Knife (x%wpnitemknife%)
if %screen%==0 if %hashealthitems% GEQ 1 echo =================================Health Items==================================
if %screen%==1 if %hashealthitems% GEQ 1 echo ======================================================Health Items======================================================
if %healthitemmh% GTR 0 echo Minor Heal (x%healthitemmh%)
if %healthitembandage% GTR 0 echo Bandage (x%healthitembandage%) 
if %healthitemah% GTR 0 echo Average Heal (x%healthitemah%)
if %healthitemmajorheal% GTR 0 echo Major Heal (x%healthitemmajorheal%)
if %healthitemrandomheal% GTR 0 echo Random Heal (x%healthitemrandomheal%)
if %screen%==0 if %hasxpitems% GEQ 1 echo ===================================XP Items====================================
if %screen%==1 if %hasxpitems% GEQ 1 echo ========================================================XP Items========================================================
if %xpitemhandwraps% GTR 0 echo Hand Wraps (x%xpitemhandwraps%)
if %xpitemchmpnb% GTR 0 echo Champion's Notebook (x%xpitemchmpnb%)
if %screen%==0 if %hasotheritems% GEQ 1 echo ==================================Other Items==================================
if %screen%==1 if %hasotheritems% GEQ 1 echo ======================================================Other Items=======================================================
if %otheritemshatter% GTR 0 echo Shatter (x%otheritemshatter%)
timeout 1 /nobreak >nul
pause
if %statson%==1 goto StatsOn
goto Menu

:Pets
cls
if %haspets%==0 echo You know you're not supposed to be here yet...
if %petjake%==1 echo Jake the Cat: +1 DMG LVL
if %pettofu%==1 echo Tofu the Cat: 5% Resistance
if %petbiki%==1 echo Biki the Dog: +30 Max Health
if %petgobble%==1 echo Gobble the Turkey: 10% Stun Resist
if %petcarius%==1 echo Carius the Demon: More critical (Raises depending on level)
pause
if %statson%==1 goto StatsOn
goto Menu

:Settings
mode %x%,%y%
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                    Settings                                    
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                        Settings                                                        
if %screen%==1 echo ========================================================================================================================
echo Say "Reset" for reset options
if %statson%==1 echo Say "Stats" to switch saved data on or off (Saved Data is On)
if %statson%==0 echo Say "Stats" to switch saved data on or off (Saved Data is Off)
if %gamemode%==0 echo Say "Gamemode" to switch from progressive to random (Gamemode: Progressive)
if %gamemode%==1 echo Say "Gamemode" to switch from random to progressive (Gamemode: Random)
if %mute%==0 echo Say "Mute" to Mute toggle mute on or off (Mute is Off)
if %mute%==1 echo Say "Mute" to Mute toggle mute on or off (Mute is On)
if %screen%==0 echo Say "Screen" to fit lines to your screen (BETA) (Current: 720p)
if %screen%==1 echo Say "Screen" to fit lines to your screen (BETA) (Current: 1080p)
if %simplify%==1 echo Simplify (BETA) is On
echo Say "Exit" to return to menu
set /p select=
if /i "%select%"=="Exit" if %statson%==1 goto StatsOn
if /i "%select%"=="Exit" goto Menu
if /i "%select%"=="Stats" goto StatsOption
if /i "%select%"=="Gamemode" goto ChangeGamemode
if /i "%select%"=="Screen" goto ScreenChange
if /i "%select%"=="CScreen" goto CustomScreen
if /i "%select%"=="Simplify" goto SimplifyChange
if /i "%select%"=="Reset" goto Reset
if /i "%select%"=="Mute" goto MuteToggle
echo "%select%" isn't a option, try again.
pause
goto Settings

:CustomScreen
set /a prevx=%x%
set /a prevy=%y%
cls
if %screen%==0 echo X? (LOWEST: 79 / CURRENT: %x%)
if %screen%==1 echo X? (LOWEST: 120 / CURRENT: %x%)
set /p x=
set /a x=%x%
if %screen%==0 if %x% LSS 79 set /a x=79
if %screen%==1 if %x% LSS 120 set /a x=120
if %screen%==0 echo Y? (LOWEST: 25 / CURRENT: %y%)
if %screen%==1 echo Y? (LOWEST: 30 / CURRENT: %y%)
set /p y=
set /a y=%y%
if %screen%==0 if %y% LSS 25 set /a y=25
if %screen%==1 if %y% LSS 30 set /a y=30
mode %x%,%y%
echo Is this good? (yes or no)
set /p select=
if /i "%select%"=="yes" (
if %statson%==1 echo %x% > "%cd%\data\x.data"
if %statson%==1 echo %y% > "%cd%\data\y.data"
goto Settings
)
set /a x=%prevx%
set /a y=%prevy%
mode %x%,%y%
goto CustomScreen

:SimplifyChange
cls
if %simplify%==0 goto SimplifyChange1
if %simplify%==1 set /a simplify=0
goto Settings

:SimplifyChange1
set /a simplify=1
goto Settings

:ChangeGamemode
cls
if %gamemode%==0 goto Gamemode1
if %gamemode%==1 set /a gamemode=0
goto Settings

:Gamemode1
set /a gamemode=1
goto Settings

:ScreenChange
cls
if %screen%==0 goto ScreenChange1
if %screen%==1 set /a screen=0
if %statson%==1 echo %screen% > "%cd%\data\screen.data"
if %x%==120 if %y%==30 (
set /a x=79
set /a y=25
)
if %x% LSS 79 set /a x=79
if %y% LSS 25 set /a y=25
mode %x%,%y%
if %statson%==1 echo %x% > "%cd%\data\x.data"
if %statson%==1 echo %y% > "%cd%\data\y.data"
goto Settings

:ScreenChange1
if %x% LSS 120 set /a x=120
if %y% LSS 30 set /a y=30
mode %x%,%y%
set /a screen=1
if %statson%==1 echo %screen% > "%cd%\data\screen.data"
if %statson%==1 echo %x% > "%cd%\data\x.data"
if %statson%==1 echo %y% > "%cd%\data\y.data"
goto Settings

:MuteToggle
set /a pmute=%mute%
if %pmute%==0 set /a mute=1
if %pmute%==1 set /a mute=0
if %statson%==1 echo %mute% > "%cd%\data\mute.data"
goto Settings

:Reset
set /a ngp=0
set /a settingsreset=0
cls
echo What would you like to reset?
if %statson%==1 echo Say "All", "NG+", "Settings", or "Exit"
if %statson%==0 echo Say "All", or "Exit"
set /p reset=
if /i "%reset%"=="All" goto ResetAll
if /i "%reset%"=="NG+" goto ResetNGPLus
if /i "%reset%"=="Settings" goto ResetSettings
if /i "%reset%"=="Exit" if %statson%==1 goto StatsOn
if /i "%reset%"=="Exit" goto Menu
if "%reset%"=="Dev" set /a dev=0
echo "%reset%" isn't a option, try again.
pause
goto Reset

:ResetSettings
set /a settingsreset=1
cls
echo Are you sure that you'd like to reset ALL?
if %statson%==0 echo WARNING: YOU HAVE SAVED-DATA OFF! THIS WILL RESET EVERYTHING!
echo You will lose EVERYTHING
echo Say "Yes" or "No"
set /p confirm=
if /i "%confirm%"=="Yes" goto Reset1
if /i "%confirm%"=="No" goto NoReset
echo That wasnt a option, try again.
pause
goto ResetSettings

:ResetNGPLus
set /a ngp=1
cls
echo New Game Plus allows you to restart with all your money and items
if %statson%==0 echo WARNING: YOU HAVE SAVED-DATA OFF! THIS WILL RESET EVERYTHING!
echo Are you sure you wanna do this?
echo Say "Yes" or "No"
set /p confirm=
if /i "%confirm%"=="Yes" goto Reset1
if /i "%confirm%"=="No" goto NoReset
echo That wasnt a option, try again.
pause
goto ResetNGPLus

:ResetAll
cls
echo Are you sure that you'd like to reset ALL?
echo You will lose EVERYTHING
echo Say "Yes" or "No"
set /p confirm=
if /i "%confirm%"=="Yes" goto Reset1
if /i "%confirm%"=="No" goto NoReset
echo That wasnt a option, try again.
pause
goto ResetAll

:Reset1
cls
echo Resetting in 5 seconds...
if %statson%==1 echo Close the game if you change your mind!
timeout 5 /nobreak > nul
echo Click any button to confirm
pause > nul
cls
echo Resetting...
if %statson%==0 goto Rested
if %settingsreset%==1 goto SettingsReset
echo 1 > "%cd%\data\lvl.data"
echo 0 > "%cd%\data\xp.data"
echo 0 > "%cd%\data\p.data"
echo 0 > "%cd%\data\ko.data"
echo 0 > "%cd%\data\td.data"
echo 0 > "%cd%\data\tw.data"
echo 0 > "%cd%\data\working.data"
echo 1 > "%cd%\data\hl.data"
echo 1 > "%cd%\data\dl.data"
echo 1 > "%cd%\data\sl.data"
echo 0 > "%cd%\data\tut.data"
echo 0 > "%cd%\data\tstg.data"
if %ngp%==1 goto Reseted
:SettingsReset
echo 0 > "%cd%\data\mute.data"
echo 1 > "%cd%\data\screen.data"
echo 0 > "%cd%\data\x.data"
echo 0 > "%cd%\data\y.data"
if %settingsreset%==1 goto Reseted
if EXIST "%cd%\data\pet\pjke.data8432" echo 0 > "%cd%\data\pet\pjke.data8432"
if EXIST "%cd%\data\pet\ptfu.data9212" echo 0 > "%cd%\data\pet\ptfu.data9212"
if EXIST "%cd%\data\pet\pbki.data5392" echo 0 > "%cd%\data\pet\pbki.data5392"
if EXIST "%cd%\data\pet\pgbl.data1135" echo 0 > "%cd%\data\pet\pgbl.data1135"
if EXIST "%cd%\data\pet\pcar.data0666" echo 0 > "%cd%\data\pet\pcar.data0666"
echo 0 > "%cd%\data\mn.data"
echo 0 > "%cd%\data\inv\stk.data"
echo 0 > "%cd%\data\inv\clts.data"
echo 0 > "%cd%\data\inv\wbt.data"
echo 0 > "%cd%\data\inv\knf.data"
echo 0 > "%cd%\data\inv\grd.data"
echo 0 > "%cd%\data\inv\grm.data"
echo 0 > "%cd%\data\inv\tsr.data"
echo 0 > "%cd%\data\inv\mnhl.data"
echo 0 > "%cd%\data\inv\avhl.data"
echo 0 > "%cd%\data\inv\mjhl.data"
echo 0 > "%cd%\data\inv\rndmhl.data"
echo 0 > "%cd%\data\inv\bdg.data" 
echo 0 > "%cd%\data\inv\xhw.data"
echo 0 > "%cd%\data\inv\chnb.data"
echo 0 > "%cd%\data\inv\shtr.data"
echo 0 > "%cd%\data\inv\btl.data" 
echo 0 > "%cd%\data\inv\ic.data" 
goto Reseted

:Reseted
set "whatreset=game has"
if %settingsreset%==0 set "whatreset=settings have"
set /a ngp=0
set /a settingsreset=0
cls
echo Your %whatreset% been reset
echo Click any button to return to the main menu
timeout 1 /nobreak > nul
pause > nul
if %statson%==0 goto StatsOff
if %statson%==1 goto StatsOn
goto Error1A

:WIP
cls
echo This is a work in progress, please wait.
pause
goto Menu

:TournamentMenu
set /a input=0
set /a said=0
if %tstage%==0 goto TournamentPurchase0
cls
echo You are in stage %tstage% of the tournament
echo Would you like to continue the tournament?
echo Say "Yes" or "No"
set /p input=
if /i "%input%"=="yes"
if /i "%input%"=="no" (
if %statson%==1 goto StatsOn
goto Menu
)
echo Sorry that isn't an option, try again!
pause
goto TournamentMenu

:TournamentPurchase0
cls
echo You are UNENTERED in the tournament (Entry Fee: $5)
if %money% LSS 5 (
echo - Sorry but you don't have enough money to enter the tournament, please come back later!
pause
if %statson%==1 goto StatsOn
goto Menu
)
echo Would you like to enter for $5?
echo Say "Yes" or "No"
set /p input=
if /i "%input%"=="yes" goto TournamentPurchase
if /i "%input%"=="no" (
if %statson%==1 goto StatsOn
goto Menu
)
echo Sorry that isn't an option, try again!
pause
goto TournamentPurchase0

:TournamentPurchase
cls
echo Are you SURE you'd like to buy a ticket to join the tournament? ($5)
echo Say "Yes" or "No"
set /p input=
if /i "%input%"=="yes" (
set /a customload=1
set /a input=0
goto LoadEClass
)
if /i "%input%"=="no" (
if %statson%==1 goto StatsOn
goto Menu
)
echo Sorry that isn't an option, try again!
pause
goto TournamentPurchase

:LoadEClass
set /a testing=0
set /a cpucb=1
set /a cpucc=1
set /a cpucbleed=1
set /a encritrange=9999
set /a wizard=0
set /a class=0
set /a givexp=0
set /a form=1
set /a givemoney=0
set /a cpuitemid=0
set /a cpuwpnitemface=0
set /a cpuwpnitemchest=0
set /a cpuwpnitemsweep=0
set /a cpuwpnitemback=0
set /a cpubleedingweapon=0
set /a bleedingweapon=0
set /a multifight=1
set /a opponentsleft=1
set /a opponent1=0
set /a opponent2=0
set /a opponent3=0
set /a stunresist=0
set /a cpustunresist=0
set /a resist=0
set /a cpuresist=0
set /a itemshattered=0
set /a cpuitemshattered=0
set /a cangoabovemaxhp=0
set /a cpucangoabovemaxhp=0
set /a cpushadowlevel=0
cls
echo Loading...
if %customload%==1 (
set /a customload=0
goto BossJohnLoad
)
if %testing%==1 (
set /a boss=100
set /a class=0
goto BossMaraxLoad
)
set /a boss=0
if %level% LSS 8 goto SkipBoss
:: If you're bellow level 8 it'll skip the code below
set /a bosschance=%random%*50/32767+1
if %bosschance%==1 if %tstage%==0 set /a boss=1
if %bosschance%==1 if %tstage%==1 set /a boss=%random%*2/32767+1
if %level% GEQ 8 if %boss%==1 goto BossMaraxLoad
if %tstage% GTR 0 if %boss%==2 goto BossJohnLoad

:SkipBoss
if %gamemode%==0 (
if %level%==1 set /a class=%random%*2/32767+1
if %level%==2 set /a class=%random%*3/32767+1
if %level%==3 set /a class=%random%*2/32767+2
if %level%==4 set /a class=%random%*3/32767+2
if %level%==5 set /a class=%random%*5/32767+2
if %level%==6 set /a class=%random%*6/32767+3
if %level%==7 set /a class=%random%*8/32767+3
if %level%==8 set /a class=%random%*7/32767+4
if %speedlevel% GTR 1 set /a class=%random%*7/32767+3
if %level% GEQ 7 if %speedlevel% GTR 1 set /a class=%random%*8/32767+4
if %level%==9 set /a class=%random%*7/32767+8
if %level%==10 set /a class=%random%*10/32767+8
)
:: Gamemode 0 ^^

if %gamemode%==1 (
if %level%==1 set /a class=%random%*2/32767+1
if %level%==2 set /a class=%random%*3/32767+1
if %level%==3 set /a class=%random%*3/32767+1
if %level%==4 set /a class=%random%*4/32767+1
if %level%==5 set /a class=%random%*6/32767+1
if %level%==6 set /a class=%random%*8/32767+1
if %level%==7 set /a class=%random%*10/32767+1
if %level%==8 set /a class=%random%*10/32767+1
if %speedlevel% GTR 1 set /a class=%random%*9/32767+1
if %level% GEQ 7 if %speedlevel% GTR 1 set /a class=%random%*11/32767+1
if %level%==9 set /a class=%random%*14/32767+1
if %level%==10 set /a class=%random%*17/32767+1
)
:: Gamemode 1 ^^

::Classes
if %class%==0 goto CPUDevClass
if %class%==1 goto CPUWeaklingClass
:: (Cuts off at level 3) ^^
if %class%==2 goto CPUNormalClass
:: Level 1 Classes ^^ (Cuts off at level 6)
if %class%==3 goto CPUYoungBezerkerClass
:: Level 2 Classes ^^ (Cuts off at level 8)
if %class%==4 goto CPUFighterClass
:: Level 4 Classes ^^
if %class%==5 goto CPUTankClass
if %class%==6 goto CPUBezerkerClass
:: Level 5 Classes ^^
if %class%==7 goto CPUSpeedyClass
:: (Cuts off at level 9) ^^
if %class%==8 goto CPUMageClass
:: Level 6 Classes ^^
if %class%==9 goto CPUKnightClass
if %class%==10 goto CPUAssassinClass
:: Level 7/8 Classes ^^
if %class%==11 goto CPUThiefClass
:: Can unlock these classes earlier if you have speed 2 & are at level 7 or above ^^
if %class%==12 goto CPUBruteClass
if %class%==13 goto CPUHitmanClass
if %class%==14 goto CPUWizardClass
:: Level 9 Classes ^^
if %class%==15 goto CPUSnowmanClass
if %class%==16 goto CPUWerewolfClass
if %class%==17 goto CPUVampireClass
:: Level 10 Classes ^^
goto Error1A

:CPUDevClass
set /a cpucb=1
set /a cpucc=1
set /a wizard=0
set /a boss=0
set /a class=0
cls
set /p class=Class?
if %class%==0 goto CPUDevClass
if %class%==1 goto CPUWeaklingClass
if %class%==2 goto CPUNormalClass
if %class%==3 goto CPUYoungBezerkerClass
if %class%==4 goto CPUFighterClass
if %class%==5 goto CPUTankClass
if %class%==6 goto CPUBezerkerClass
if %class%==7 goto CPUSpeedyClass
if %class%==8 goto CPUMageClass
if %class%==12 goto CPUKnightClass
if %class%==9 goto CPUAssassinClass
if %class%==10 goto CPUThiefClass
if %class%==11 goto CPUBruteClass
if %class%==13 goto CPUHitmanClass
if %class%==14 goto CPUWizardClass
if %class%==15 goto CPUSnowmanClass
if %class%==16 goto CPUWerewolfClass
if %class%==17 goto CPUVampireClass

set /a cpuhealthlevel=1
set /a cpudamagelevel=1
set /a cpuspeedlevel=1
set /p cpuhealthlevel=Health Lvl: 
if %cpuhealthlevel%==0 set /p cpuhealth=CPU Health:
set /p cpudamagelevel=Damage Lvl: 
set /p cpuspeedlevel=Speed Lvl: 
goto Load

:CPUNormalClass
set /a cpuhealthlevel=1
set /a cpudamagelevel=1
set /a cpuspeedlevel=1
set /a cpucc=0
if %level%==1 set /a givexp=25
if %level%==2 set /a givexp=19
if %level%==3 set /a givexp=15
if %level% GEQ 4 set /a givexp=(10-(%level%/2))
set "classname=Normal"
goto Load

:CPUWeaklingClass
set /a cpuhealthlevel=0
set /a cpudamagelevel=1
set /a cpuspeedlevel=1
set /a cpuhealth=80
set /a cpucc=0
if %level%==1 set /a givexp=20
if %level% GEQ 2 set /a givexp=15
if %level% GEQ 4 set /a givexp=(10-(%level%/2))
set "classname=Weakling"
goto Load

:CPUSpeedyClass
set /a cpuhealthlevel=1
set /a cpudamagelevel=1
set /a cpuspeedlevel=2
set /a encritrange=30
if %level% LEQ 19 set /a givexp=%maxlevel%-%level%
if %speedlevel%==2 if %level% LEQ 19 (
if %level%==6 set /a givexp=20
if %level%==7 set /a givexp=16
if %level%==8 set /a givexp=14
)
if %speedlevel%==1 if %level% LEQ 19 (
if %level%==6 set /a givexp=35
if %level%==7 set /a givexp=25
if %level%==8 set /a givexp=19
if %level%==9 set /a givexp=14
)
set "classname=Speedy"
goto Load

:CPUTankClass
set /a cpuhealthlevel=0
set /a cpuhealth=200
set /a cpudamagelevel=1
set /a cpuspeedlevel=1
set /a encritrange=30
set /a givexp=(10-(%level%/2))
if %level%==5 set /a givexp=30
if %level%==6 set /a givexp=24
if %level%==7 set /a givexp=18
set "classname=Tank"
goto Load

:CPUFighterClass
set /a cpuhealthlevel=0
set /a cpudamagelevel=2
set /a cpuspeedlevel=1
set /a cpuhealth=150
set /a encritrange=34
set /a givexp=(10-(%level%/2))
if %level%==4 set /a givexp=24
if %level%==5 set /a givexp=18
set "classname=Fighter"
goto Load

:CPUYoungBezerkerClass
set /a cpuhealthlevel=0
set /a cpudamagelevel=2
set /a cpuspeedlevel=1
set /a cpuhealth=90
set /a encritrange=26
set /a givexp=%maxlevel%-%level%
if %level%==2 set /a givexp=30
if %level%==3 set /a givexp=26
if %level%==4 set /a givexp=22
if %level%==5 set /a givexp=20
if %level%==6 set /a givexp=16
set "classname=Bezerker (Young)"
goto Load

:CPUBezerkerClass
set /a cpuhealthlevel=1
set /a cpudamagelevel=3
set /a cpuspeedlevel=1
set /a encritrange=20
set /a givexp=%maxlevel%-%level%
if %level% GEQ 5 if %level% LEQ 9 set /a givexp=32-((%level%-5)*4)
:: If you level is between 5-9 then give 32 XP, minus 3 XP per level
set "classname=Bezerker"
goto Load

:CPUAssassinClass
set /a cpuhealthlevel=2
set /a cpudamagelevel=2
set /a cpuspeedlevel=2
set /a encritrange=20
set /a givexp=(10-(%level%/2))
if %level%==7 set /a givexp=32
if %level%==8 set /a givexp=28
if %level%==9 set /a givexp=24
if %level%==10 set /a givexp=18
set "classname=Assassin"
goto Load

:CPUBruteClass
set /a cpuhealthlevel=0
set /a cpuhealth=250
set /a cpudamagelevel=3
set /a cpuspeedlevel=1
set /a encritrange=18
set /a cpustunresist=10
if %level% LEQ 19 set /a givexp=%maxlevel%-%level%
if %level% LEQ 7 set /a givexp=30
if %level%==8 set /a givexp=26
if %level%==9 set /a givexp=20
if %level%==10 set /a givexp=14
set "classname=Brute"
goto Load

:CPUWerewolfClass
set /a cpuhealthlevel=0
set /a cpuhealth=90
set /a cpudamagelevel=5
set /a cpuspeedlevel=2
set /a encritrange=8
set /a cpustunresist=10
if %level% LEQ 19 set /a givexp=%maxlevel%-%level%
if %level%==8 set /a givexp=40
if %level%==9 set /a givexp=34
if %level%==10 set /a givexp=28
if %level%==11 set /a givexp=22
if %level%==12 set /a givexp=16
set "classname=Werewolf"
goto Load

:CPUVampireClass
set /a cpuhealthlevel=2
set /a cpudamagelevel=4
set /a cpuspeedlevel=1
set /a encritrange=16
set /a cpustunresist=5
if %level% LEQ 19 set /a givexp=%maxlevel%-%level%
if %level%==9 set /a givexp=48
if %level%==10 set /a givexp=40
if %level%==11 set /a givexp=36
if %level%==12 set /a givexp=28
if %level%==13 set /a givexp=22
if %level%==14 set /a givexp=18
set "classname=Vampire (Normal)"
goto Load

:CPUSnowmanClass
set /a cpuhealthlevel=0
set /a cpuhealth=120
set /a cpudamagelevel=2
set /a cpuspeedlevel=1
set /a encritrange=20
set /a cpuwpnitemface=4
set /a cpuwpnitemchest=5
set /a cpuwpnitemsweep=2
set /a cpuwpnitemback=3
set /a cpuitemid=1
set /a cpubleedingweapon=1
set /a cpuresist=10
if %level% LSS %maxlevel% set /a givexp=(%maxlevel%-%level%)*2
if %level%==9 set /a givexp=40
if %level%==10 set /a givexp=34
if %level%==11 set /a givexp=30
if %level%==12 set /a givexp=24
if %level%==13 set /a givexp=20
if %level%==14 set /a givexp=16
set "classname=Snowman"
goto Load

:CPUThiefClass
set /a cpuhealthlevel=0
set /a cpuhealth=150
set /a cpudamagelevel=1
set /a cpuspeedlevel=2
set /a encritrange=20
set /a cpuwpnitemface=2
set /a cpuwpnitemchest=3
set /a cpuwpnitemsweep=2
set /a cpuwpnitemback=3
set /a cpubleedingweapon=1
set /a cpuitemid=1
set /a givemoney=3
if %level% GEQ 9 set /a givexp=18-((%level%-9)*4)
if %level% GTR 11 set /a givexp=21-%level%
set "classname=Thief"
goto Load

:CPUThief2Class
set /a form=2
set /a cpuhealthlevel=3
set /a cpudamagelevel=5
set /a cpuspeedlevel=1
set /a encritrange=14
set /a cpuwpnitemface=3
set /a cpuwpnitemchest=3
set /a cpuwpnitemsweep=3
set /a cpuwpnitemback=3
set /a cpuitemid=1
set /a givemoney=6
set /a cpustunresist=5
if %level%==9 set /a givexp=40
if %level%==10 set /a givexp=34
if %level%==11 set /a givexp=30
if %level%==12 set /a givexp=24
if %level%==13 set /a givexp=20
if %level%==14 set /a givexp=16
if %level% GTR 14 set /a givexp=20-%level%
set "classname=Cop"
goto Load

:CPUKnightClass
set /a cpuhealthlevel=0
set /a cpuhealth=120
set /a cpudamagelevel=2
set /a cpuspeedlevel=1
set /a encritrange=11
set /a cpuwpnitemface=4
set /a cpuwpnitemchest=4
set /a cpuwpnitemsweep=4
set /a cpuwpnitemback=4
set /a cpubleedingweapon=1
set /a cpuitemid=1
set /a cpuresist=25
set /a cpucbleed=0
set /a givexp=%maxlevel%-%level%
if %level% GEQ 5 if %level% LEQ 9 set /a givexp=30-((%level%-7)*5)
set "classname=Knight"
:: If your level is between 5-9 then give 28 XP, minus 4 XP per level
goto Load

:CPUMageClass
set /a cpuhealthlevel=0
set /a cpudamagelevel=1
set /a cpuspeedlevel=1
set /a cpuhealth=120
set /a encritrange=24
set /a cpucb=0
set /a wizard=1
if %level% LEQ 19 set /a givexp=%maxlevel%-%level%
if %level% LEQ 7 set /a givexp=30
if %level%==8 set /a givexp=24
if %level%==9 set /a givexp=18
if %level%==10 set /a givexp=16
set "classname=Mage"
goto Load

:CPUWizardClass
set /a cpuhealthlevel=0
set /a cpudamagelevel=2
set /a cpuspeedlevel=1
set /a cpuhealth=180
set /a encritrange=14
set /a cpuwpnitemface=5
set /a cpuwpnitemchest=5
set /a cpuwpnitemsweep=5
set /a cpuwpnitemback=5
set /a cpuitemid=1
set /a cpucb=0
set /a wizard=1
if %level% GEQ 9 set /a givexp=36-((%level%-9)*4)
if %givexp% LSS 1 set /a givexp=1
set "classname=Wizard"
goto Load

:CPUHitmanClass
set /a cpuhealthlevel=2
set /a cpudamagelevel=3
set /a cpuspeedlevel=2
set /a encritrange=16
set /a cpustunresist=5
if %level%==7 set /a givexp=36
if %level%==8 set /a givexp=32
if %level%==9 set /a givexp=26
if %level%==10 set /a givexp=32
if %level%==11 set /a givexp=28
if %level%==12 set /a givexp=25
if %level%==13 set /a givexp=20
if %level% GTR 13 set /a givexp=(%maxlevel%-%level%)*2
set "classname=Hitman"
goto Load

:BossMaraxLoad
set /a cpucb=1
set /a cpucc=1
set /a wizard=0
set /a boss=1
::Above is here for debug option, can remove when you remove "DebugMarax"
set /a cpuhealth=250
set /a cpuhealthlevel=0
set /a cpudamagelevel=3
set /a cpuspeedlevel=1
set /a givexp=200-((%level%-8)*15)
set /a encritrange=12d
set /a givemoney=10
set /a cpustunresist=20
set /a cpuresist=10
set "classname=Marax the Crusher!"
goto Load

:BossJohnLoad
set /a boss=2
set /a cpuhealthlevel=1
set /a cpudamagelevel=2
set /a cpuspeedlevel=1
set /a encritrange=16
set /a givexp=250-((%level%-10)*16)
set /a opponentsleft=3
set /a opponent1=100
set /a opponent2=120
set /a opponent3=80
set "classname=John"
goto Load

:MaraxIntro
cls
if %statson%==1 start images\marax.jpg
if %mute%==1 goto MaraxIntro2
nircmd.exe killprocess wscript.exe
set "file=sounds\maraxw.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
set "file=sounds\maraxmusic.m4a"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >music.vbs
start /min music.vbs
:MaraxIntro2
cls
echo You have encountered Marax the Crusher! (BOSS)
if %statson%==1 (
timeout 8 /nobreak >nul
nircmd.exe killprocess Microsoft.Photos.exe
nircmd.exe killprocess dllhost.exe
)
pause
goto Game

:JohnsIntro
cls
if %said%==0 (
set /a valid=0
echo ...
timeout 2 /nobreak >nul
color c
echo Johnny: "HAHAHAHAHAHAHAHA!"
echo Johnny: DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME! DIE TIME! DYING TIME!
timeout 2 >nul
color a
cls
echo Johnny: "HAHAHAHAHAHAHAHA!"
timeout 2 /nobreak >nul
)
echo John: "Sorry but you can't do that.."
if %said%==0 (
timeout 3 >nul
timeout 2 /nobreak >nul
)
echo Jonathan: "You really thought all this was just a coincidence?"
if %said%==0 (
timeout 4 >nul
timeout 1 /nobreak >nul
)
echo Jonathan: "You're not allowed to join this year's tournament, or any year's tournament for that matter.."
if %said%==0 (
timeout 4 >nul
timeout 1 /nobreak >nul
)
echo Jonathan: "Nex'lac, wouldn't exactly be happy if you joined this years tournament"
if %said%==0 (
timeout 2 >nul
timeout 1 /nobreak >nul
)
echo Jonathan: "Hm, especially after what happened in your last tournament"
if %said%==0 (
timeout 6 >nul
timeout 1 /nobreak >nul
)
echo Jonathan: "So I'm sorry to say it.. but your journey ends here..."
if %said%==0 (
timeout 4 >nul
timeout 1 /nobreak >nul
)
echo Jonathan: "You won't be joining this year's tournament"
if %said%==0 (
timeout 4 >nul
timeout 1 /nobreak >nul
)
echo Johnny: "YEAH, unless you wanna go through us, hmm.."
if %said%==0 (
timeout 2 >nul
timeout 1 /nobreak >nul
)
set /a said=1
if %valid% GTR 0 goto JohnsIntroAC
echo.
echo What do you wanna say?
echo Type a number from 1-4
echo 1: Who's Nex'lac?
echo 2: Who are you people?
echo 3: Alright, I won't join then.
echo 4: Get out of my way!
set /p input=
if "%input%"=="1" set /a valid=1
if "%input%"=="2" set /a valid=2
if "%input%"=="3" set /a valid=3
if "%input%"=="4" set /a valid=4
if %valid% LSS 1 (
echo That's not a choice! Try again!
pause
)
goto JohnsIntro
:JohnsIntroAC
if %valid%==1 (
echo You: "Who's Nex'lac?"
timeout 1  >nul
timeout 1 /nobreak >nul
echo Johnny: "He's the one that decided your career was over in the first place"
timeout 2  >nul
timeout 1 /nobreak >nul
echo Johnny: "And I don't recall him saying you could come back now did he??"
timeout 3  >nul
timeout 1 /nobreak >nul
echo Jonathan: "Johnny you idiot, you're not supposed to tell him that shut up!"
timeout 3  >nul
timeout 1 /nobreak >nul
echo Johnny: "What? It doesn't matter.. This'll all be over for him soon anyways..."
timeout 5  >nul
timeout 1 /nobreak >nul
color c
echo Johnny: "TIME TO DIE!"
timeout 1 /nobreak >nul
pause
color a
goto Game
)
if %valid%==2 (
echo You: "Who are you people?"
timeout 3  >nul
timeout 1 /nobreak >nul
echo Jonathan: "We're just here to make sure you can't join the tournament, that's all.."
timeout 4  >nul
timeout 1 /nobreak >nul
echo Jonathan: "It's none of your business really"
timeout 3  >nul
timeout 1 /nobreak >nul
echo John: "Let's just get this over with..."
timeout 3  >nul
timeout 1 /nobreak >nul
echo Jonathan: "Indeed, let's fight then shall we, OLD champion?"
timeout 3  >nul
timeout 1 /nobreak >nul
pause
goto Game
)
if %valid%==3 (
echo You: "Alright, I won't join then."
timeout 3 >nul
timeout 1 /nobreak >nul
echo Johnny: "Do you think we really care?"
timeout 2 >nul
timeout 1 /nobreak >nul
echo Johnny: "We're here to kill you to ensure you can't join and that's what we're gonna do!"
timeout 5 >nul
timeout 1 /nobreak >nul
echo Johnny: "So it's fight or die, and I'm perfectly okay with a free kill.. wouldn't be my first.."
timeout 2 >nul
timeout 1 /nobreak >nul
pause
goto Game
)
if %valid%==4 (
echo You: "Get out of my way now!"
timeout 2 >nul
timeout 1 /nobreak >nul
echo Johnny: "Ooo, a feisty one I see!"
timeout 2 >nul
timeout 1 /nobreak >nul
echo Johnny: "I'll have fun ripping you limb from limb..."
timeout 4 >nul
timeout 1 /nobreak >nul
echo Johnny: "Heh, let's get this horror started.."
timeout 1 /nobreak >nul
pause
goto Game
)

:JohnsIntro2
cls
echo You've encountered the Johns! (John, Jonathan, and Johnny) (BOSS)
timeout 3 /nobreak >nul
pause
cls
timeout 1 /nobreak >nul
echo Johnny: "What? It's you again?"
timeout 2 >nul
timeout 1 /nobreak >nul
echo Johnny: "Haha, my day only gets better!"
timeout 2 >nul
timeout 1 /nobreak >nul
echo Johnny: "Let's try and make this quick.."
timeout 2 >nul
timeout 1 /nobreak >nul
echo Press anything to start the battle
pause >nul
goto Game

:JohnsBossCutScene
set /a cpushadowlevel=1
cls
if %multifight%==1 (
set /a cpuresist=20
set /a cpuhealth=100
set /a damagelevel=3
cls
echo John: "What? I can't believe this you've defeated all my brothers?!"
timeout 4 >nul
timeout 1 /nobreak >nul
echo John: "We've lost.."
timeout 3 >nul
timeout 1 /nobreak >nul
echo John: "NO! I refuse to be defeated by you!"
timeout 4 >nul
timeout 1 /nobreak >nul
echo John: "Nex'lac gave me a job and I'm gonna finish it!"
timeout 4 >nul
timeout 1 /nobreak >nul
echo John: "Nex'lac my lord, give me some power so I can defeat this WEAKLING!"
timeout 5 >nul
timeout 1 /nobreak >nul
)
if %multifight%==2 (
set /a cpuresist=50
set /a cpuhealth=%cpuhealth%+20
set /a damagelevel=2
cls
echo Jonathan: "Huh? I'm the last one?? Shit..."
timeout 5  >nul
timeout 1 /nobreak >nul
echo Jonathan: "I can't do this by myself!"
timeout 3  >nul
timeout 1 /nobreak >nul
echo Jonathan: "You're gonna be sorry for this!"
timeout 4  >nul
timeout 1 /nobreak >nul
echo Jonathan: "Shadow lord, bless me with some of your power!"
timeout 5  >nul
timeout 1 /nobreak >nul
)
if %multifight%==3 (
set /a cpuresist=10
set /a cpuhealth=%cpuhealth%+40
set /a damagelevel=5
cls
echo Johnny: "Haha, looks like I'm all on my own now"
timeout 3 >nul
timeout 1 /nobreak >nul
echo Johnny: "No worries though, I'll have fun killing you"
timeout 2 >nul
timeout 1 /nobreak >nul
echo Johnny: "Nex'lac lend me some power!"
timeout 4 >nul
timeout 1 /nobreak >nul
)
if %mute%==1 goto JohnsBossCutScene1
nircmd.exe killprocess wscript.exe
set "file=sounds\transform.m4a"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
:JohnsBossCutScene1
if %multifight%==1 (
echo John: "ARG! YES!! I feel so much stronger!"
timeout 4 >nul
timeout 1 /nobreak >nul
echo John: "I feel almost overwhelmed..."
timeout 3 >nul
timeout 1 /nobreak >nul
echo John: "It's hard to control!"
timeout 3 >nul
timeout 1 /nobreak >nul
echo John: "LET'S GET BACK INTO THIS! I'LL SHOW YOU WHAT YOU GET FOR DEFEATING MY BROTHERS!"
timeout 4 >nul
timeout 1 /nobreak >nul
echo Press anything to resume the battle
pause >nul
)
if %multifight%==2 (
echo Jonathan: "Wow! That was quick!.."
timeout 3 >nul
timeout 1 /nobreak >nul
echo Jonathan: "Alright.. now all I gotta do is stay calm.."
timeout 4 >nul
timeout 1 /nobreak >nul
echo Jonathan: "ARG, I've got this.. remain under.. control..."
timeout 4 >nul
timeout 1 /nobreak >nul
echo Jonathan: "ALRIGHT! Enough waiting, I've got this under control. This battle is over!"
timeout 4 >nul
timeout 1 /nobreak >nul
echo Press anything to resume the battle
pause >nul
)
if %multifight%==3 (
cls
echo Johnny: "ARG, yes! I can feel his power rushing through my veins!"
timeout 3 >nul
timeout 1 /nobreak >nul
echo Johnny: "I'll end this quickly"
timeout 3 >nul
timeout 1 /nobreak >nul
echo Press anything to resume the battle
pause >nul
)
goto Game

:Load
if %mute%==0 nircmd.exe killprocess wscript.exe
set /a musicrunning=0
if %healthlevel%==1 set /a maxhealth=100
if %healthlevel%==2 set /a maxhealth=125
if %healthlevel%==3 set /a maxhealth=175
if %healthlevel%==4 set /a maxhealth=225
if %healthlevel%==5 set /a maxhealth=275
if %healthlevel%==6 set /a maxhealth=320
if %petbiki%==1 set /a maxhealth=%maxhealth%+30
set /a health=%maxhealth%
if %cpuhealthlevel%==0 set /a cpumaxhealth=%cpuhealth%
if %cpuhealthlevel%==1 set /a cpumaxhealth=100
if %cpuhealthlevel%==2 set /a cpumaxhealth=125
if %cpuhealthlevel%==3 set /a cpumaxhealth=175
if %cpuhealthlevel%==4 set /a cpumaxhealth=225
if %cpuhealthlevel%==5 set /a cpumaxhealth=275
if %cpuhealthlevel%==6 set /a cpumaxhealth=320
set /a cpuhealth=%cpumaxhealth%
if %statson%==1 echo 1 > "%cd%\data\q.data"
set /a defeatedopponent=0
set /a changeform=0
set /a openingline=0
set /a line=0
set /a cpudamage=0
set /a damage=0
set /a vcpudamage=0
set /a vdamage=0
set /a cpumove=0
set /a cpumove2=0
set /a cpumove3=0
set /a move=0
set /a move2=0
set /a move3=0
set /a pmove=0
set /a pmove2=0
set /a pmove3=0
set /a sameattack=0
set /a sameattack2=0
set /a sameattack3=0
set /a backmove=0
set /a backmove2=0
set /a backmove3=0
set /a cpubackmove=0
set /a cpubackmove2=0
set /a cpubackmove3=0
set /a specialmove1=0
set /a specialmove2=0
set /a specialmove3=0
set /a cpubleedingdamage=0
set /a bleedingdamage=0
set /a overkill=0
set /a think=0
set /a damageitem=0
set /a healthitem=0
set /a xpitem=0
set /a wpnitemface=0
set /a wpnitemchest=0
set /a wpnitemsweep=0
set /a wpnitemback=0
set /a efacexp=0
set /a echestxp=0
set /a esweepxp=0
set /a ebackxp=0
set /a itemid=0
set /a xpitemid=0
set /a itembreakable=0
set /a itembreakchance=0
set /a crit=0
set /a encrit=0
set /a heal=0
set /a cpuheal=0
set /a vheal=0
set /a vcpuheal=0
set /a dmgitem=0
set /a cpustunned=0
set /a stunned=0
set /a stunnedrounds=0
set /a cpustunnedrounds=0
set /a stunrange=0
set /a unstun=0
set /a cpuunstun=0
set /a cpustunrange=0
set /a gamedamagelevel=%damagelevel%
set /a gamespeedlevel=%speedlevel%
set /a ocpuspeedlevel=%cpuspeedlevel%
set /a ostunrange=0
set /a ocpustunrange=0
set /a cpucountered1=0
set /a cpucountered2=0
set /a cpucountered3=0
set /a countered1=0
set /a countered2=0
set /a countered3=0
set /a cpubleeding=0
set /a cpuslowrounds=0
set /a slowrounds=0
set /a bleeding=0
set /a bleed=0
set /a slowbleeding=0
set /a itembroke=0
set /a refreshed=1
set /a snapped=0
set /a dummy=0
set /a critrange=24-%level%
if %level% LEQ 3 set /a critrange=%critrange%+27
if %level% LEQ 7 set /a critrange=%critrange%+15
if %petcarius%==1  set /a critrange=%critrange%-1
if %petjake%==1 set /a gamedamagelevel=%gamedamagelevel%+1
if %pettofu%==1 set /a resist=5
if %petgobble%==1 set /a stunresist=10
if %tstage%==0 if %boss%==2 goto JohnsIntro
if %tstage% GTR 0 if %boss%==2 goto JohnsIntro2
if %level% GEQ 8 if %boss%==1 goto MaraxIntro
goto Game

:Game
if %givexp% LSS 0 set /a givexp=0
if %level% GEQ %maxlevel% set /a givexp=0
set /a icr=2
set /a itemmenu=0
if %health% LSS 0 set /a health=0
if %cpuhealth% LSS 0 set /a overkill=%cpuhealth%*-1
if %cpuhealth% LSS 0 set /a cpuhealth=0
if %cpuhealth% LEQ 0 set /a opponentsleft=%opponentsleft%-1
if %cpuhealth% LEQ 0 if %opponentsleft% GEQ 1 (
set /a defeatedopponent=1
goto GameValidAttack005John
)
if %opponentsleft%==0 if %boss%==1 if %cpuhealth% LSS 1 if %health% GTR 0  goto MaraxWin
if %opponentsleft%==0 if %cpuhealth% LSS 1 if NOT %crit%==1 if %health% GTR 0 goto Win

if %refreshed%==0 goto Refreshed
set /a facedmg=((50+((50/2)*(%gamedamagelevel%-1)))/10)+%wpnitemface%
set /a vfacedmg=((%facedmg%*100)-(%facedmg%*%cpuresist%))/100
set /a chestdmg=4+(2*(%gamedamagelevel%-1))+%wpnitemchest%
set /a vchestdmg=((%chestdmg%*100)-(%chestdmg%*%cpuresist%))/100
set /a sweepdmg=((30+((30/2)*(%gamedamagelevel%-1)))/10)+%wpnitemsweep%
set /a vsweepdmg=((%sweepdmg%*100)-(%sweepdmg%*%cpuresist%))/100
set /a backfaildmg=(6+(3*(%cpudamagelevel%-1))+%cpuwpnitemchest%)
set /a backdmg=10+((10/2)*(%gamedamagelevel%-1))+%wpnitemback%
set /a vbackdmg=((%backdmg%*100)-(%backdmg%*%cpuresist%))/100
set /a blockfacedmg=10+(5*(%gamedamagelevel%-1))
set /a vblockfacedmg=((%blockfacedmg%*100)-(%blockfacedmg%*%cpuresist%))/100
set /a blockchestdmg=8+(4*(%gamedamagelevel%-1))
set /a vblockchestdmg=((%blockchestdmg%*100)-(%blockchestdmg%*%cpuresist%))/100
set /a blocksweepdmg=6+(3*(%gamedamagelevel%-1))
set /a vblocksweepdmg=((%blocksweepdmg%*100)-(%blocksweepdmg%*%cpuresist%))/100
set /a blockbackdmg=20+(10*(%gamedamagelevel%-1))
set /a vblockbackdmg=((%blockbackdmg%*100)-(%blockbackdmg%*%cpuresist%))/100
set /a blockbackfaildmg=12+(6*(%gamedamagelevel%-1))
set /a vblockbackfaildmg=((%blockbackfaildmg%*100)-(%blockbackfaildmg%*%cpuresist%))/100
set /a refreshed=0
:Refreshed

set /a validmove=0
if %gamespeedlevel% GEQ 2 set /a validmove2=0
if %gamespeedlevel%==3 set /a validmove3=0
if %gamespeedlevel%==1 set /a validmove2=1
if %gamespeedlevel%==1 set /a validmove3=1
color a
if %cpustunned%==1 color b
if %cpudamage% GTR 0 if %crit%==1 color e
if %damage% GTR 0 if %encrit%==1 color d
if %stunned%==1 color b
if %snapped%==1 color c

if %boss%==1 if %mute%==0 (
set /a musicrunning=0
tasklist /nh /fi "imagename eq wscript.exe" | find /i "wscript.exe" >nul && (
set /a musicrunning=1
)
if %musicrunning%==0 goto PlayMaraxMusic
)

cls
if %screen%==0 if %snapped%==1 echo ====================================Snapped====================================
if %screen%==1 if %snapped%==1 echo =========================================================Snapped========================================================
if %dev%==1 echo Class: %class% Boss: %boss%
if %class%==16 if %cpudamagelevel% GTR 6 echo BEWARE OPPONENT DAMAGE LEVEL IS %cpudamagelevel%
if NOT %class%==0 echo Opponent Class: %classname%
if NOT %boss%==0 echo Opponent: %classname% (BOSS)
if %vdamage% LSS 1 if %vheal% LSS 1 if %bleeding% LEQ 0 echo Player Health: %health%
if %vdamage% LSS 1 if %bleeding% GTR 0 echo Player Health: %health% (Bleeding: %bleeding%)
if %vdamage% GEQ 1 if %bleeding% LEQ 0 echo Player Health: %health% (Damage Taken: %vdamage%)
if %vdamage% GEQ 1 if %bleeding% GTR 0 echo Player Health: %health% (Damage Taken: %vdamage%) (Bleeding: %bleeding%)
if %vheal% GEQ 1 if %bleeding% LEQ 0 echo Player Health: %health% (Healed: %vheal%)
if %vheal% GEQ 1 if %bleeding% GTR 0 echo Player Health: %health% (Healed: %vheal%) (Bleeding: %bleeding%)
if %vcpudamage% LSS 1 if %cpuheal% LSS 1 if %cpubleeding% LEQ 0 echo Opponent Health: %cpuhealth%
if %vcpudamage% LSS 1 if %cpubleeding% GTR 0 echo Opponent Health: %cpuhealth% (Bleeding: %cpubleeding%)
if %vcpudamage% GEQ 1 if %cpubleeding% LEQ 0 echo Opponent Health: %cpuhealth% (Damage Taken: %vcpudamage%)
if %vcpudamage% GEQ 1 if %cpubleeding% GTR 0 echo Opponent Health: %cpuhealth% (Damage Taken: %vcpudamage%) (Bleeding: %cpubleeding%)
if %vcpuheal% GEQ 1 if %cpubleeding% LEQ 0 echo Opponent Health: %cpuhealth% (Healed: %vcpuheal%)
if %vcpuheal% GEQ 1 if %cpubleeding% GTR 0 echo Opponent Health: %cpuhealth% (Healed: %vcpuheal%) (Bleeding: %cpubleeding%)
if %xpitemid%==10000 echo USING XP ITEM: HAND WRAPS -1 FACE, -1 CHEST, -1 BACK, +1 XP EVERYTHING
if %xpitemid%==1 echo USING XP ITEM: HAND WRAPS +1 XP FROM EVERYTHING
if %itemid%==1 echo USING ITEM: STICK +1 ALL AREAS
if %itemid%==2 echo USING ITEM: CLEATS +2 FACE, +2 CHEST, +3 BACK
if %itemid%==3 echo USING ITEM: KNIFE +3 FACE, +3 CHEST, +2 SWEEP, +4 BACK (BLEEDING CHANCE)
if %itemid%==4 echo USING ITEM: BROKEN BOTTLE +1 FACE, +1 CHEST (BLEEDING CHANCE)
if %itemid%==5 echo USING ITEM: BAT +3 FACE, +3 CHEST, +2 BACK
if %class%==9 if %cpuitemid%==1 echo OPPONENT USING ITEM: SWORD +4 DMG TO ALL (BLEEDING CHANCE)
if %class%==11 if %form%==1 if %cpuitemid%==1 echo OPPONENT USING ITEM: KNIFE +2 FACE, +3 CHEST, +2 SWEEP, +3 BACK (BLEEDING CHANCE)
if %class%==11 if %form%==1 if %cpuitemid%==2 echo OPPONENT USING ITEM: GUT KNIFE +3 FACE, +10 CHEST, +1 SWEEP, +4 BACK (BLEEDING CHANCE)
if %class%==11 if %form%==2 if %cpuitemid%==1 echo OPPONENT USING ITEM: BATON +3 FACE, +3 CHEST, +3 SWEEP, +3 BACK 
if %class%==15 if %cpuitemid%==1 echo OPPONENT USING ITEM: ICICLE +4 FACE, +5 CHEST, +2 SWEEP, +3 BACK  (BLEEDING CHANCE)
if %class%==14 if %cpuitemid%==1 echo OPPONENT USING ITEM: STAFF +5 DMG TO ALL
if %screen%==0 if %facedmg% LSS 10 echo Say "Face" to hit your opponent in the face                             (%vfacedmg% DMG)
if %screen%==0 if %facedmg% GEQ 10 echo Say "Face" to hit your opponent in the face                            (%vfacedmg% DMG)
if %screen%==0 if %chestdmg% LSS 10 echo Say "Chest" to hit your opponent in the chest                           (%vchestdmg% DMG)
if %screen%==0 if %chestdmg% GEQ 10 echo Say "Chest" to hit your opponent in the chest                          (%vchestdmg% DMG)
if %screen%==0 if %sweepdmg% LSS 10 echo Say "Sweep" to sweep your opponent                                      (%vsweepdmg% DMG)
if %screen%==0 if %sweepdmg% GEQ 10 echo Say "Sweep" to sweep your opponent                                     (%vsweepdmg% DMG)
if %screen%==0 if %backfaildmg% LSS 10  echo Say "Back" to attempt a back attack                     (%vbackdmg% DMG / %backfaildmg% FAILED DMG)
if %screen%==0 if %backfaildmg% GEQ 10  echo Say "Back" to attempt a back attack                    (%vbackdmg% DMG / %backfaildmg% FAILED DMG)
if %screen%==0 echo Say "Blockface" to counter a face attack                               (%vblockfacedmg% DMG)
if %screen%==0 if %blockchestdmg% LSS 10 echo Say "Blockchest" to counter a chest attack                              (%vblockchestdmg% DMG)
if %screen%==0 if %blockchestdmg% GEQ 10 echo Say "Blockchest" to counter a chest attack                             (%vblockchestdmg% DMG)
if %screen%==0 if %blocksweepdmg% LSS 10 echo Say "Blocksweep" to counter a sweep                                     (%vblocksweepdmg% DMG)
if %screen%==0 if %blocksweepdmg% GEQ 10 echo Say "Blocksweep" to counter a sweep                                    (%vblocksweepdmg% DMG)
if %screen%==0 echo Say "Blockback" to counter a back attack                               (%vblockbackdmg% DMG)
if %screen%==1 if %simplify%==1 echo "Face" (%facedmg% DMG) / "Chest" (%chestdmg% DMG) / "Sweep" (%sweepdmg% DMG) // "Back" (%backdmg% DMG / %backfaildmg% FAIL SELF-DMG)
if %screen%==1 if %simplify%==1 echo "BlockFace" (%blockfacedmg% DMG) / "BlockChest" (%blockchestdmg% DMG) / "BlockSweep" (%blocksweepdmg% DMG) // "BlockBack" (%blockbackdmg% DMG / %blockbackfaildmg% FAIL DMG)
if %screen%==1 if %simplify%==0 if %vfacedmg% LSS 10 echo Say "Face" to hit your opponent in the face                                                                      (%vfacedmg% DMG)
if %screen%==1 if %simplify%==0 if %vfacedmg% GEQ 10 echo Say "Face" to hit your opponent in the face                                                                     (%vfacedmg% DMG)
if %screen%==1 if %simplify%==0 if %vchestdmg% LSS 10 echo Say "Chest" to hit your opponent in the chest                                                                    (%vchestdmg% DMG)
if %screen%==1 if %simplify%==0 if %vchestdmg% GEQ 10 echo Say "Chest" to hit your opponent in the chest                                                                   (%vchestdmg% DMG)
if %screen%==1 if %simplify%==0 if %vsweepdmg% LSS 10 echo Say "Sweep" to sweep your opponent                                                                               (%vsweepdmg% DMG)
if %screen%==1 if %simplify%==0 if %vsweepdmg% GEQ 10 echo Say "Sweep" to sweep your opponent                                                                              (%vsweepdmg% DMG)
if %screen%==1 if %simplify%==0 if %backfaildmg% LSS 10  echo Say "Back" to attempt a back attack                                                              (%vbackdmg% DMG / %backfaildmg% FAILED DMG)
if %screen%==1 if %simplify%==0 if %backfaildmg% GEQ 10  echo Say "Back" to attempt a back attack                                                             (%vbackdmg% DMG / %backfaildmg% FAILED DMG)
if %screen%==1 if %simplify%==0 echo Say "Blockface" to counter a face attack                                                                        (%vblockfacedmg% DMG)
if %screen%==1 if %simplify%==0 if %vblockchestdmg% LSS 10 echo Say "Blockchest" to counter a chest attack                                                                       (%vblockchestdmg% DMG)
if %screen%==1 if %simplify%==0 if %vblockchestdmg% GEQ 10 echo Say "Blockchest" to counter a chest attack                                                                      (%vblockchestdmg% DMG)
if %screen%==1 if %simplify%==0 if %vblocksweepdmg% LSS 10 echo Say "Blocksweep" to counter a sweep                                                                              (%vblocksweepdmg% DMG)
if %screen%==1 if %simplify%==0 if %vblocksweepdmg% GEQ 10 echo Say "Blocksweep" to counter a sweep                                                                             (%vblocksweepdmg% DMG)
if %screen%==1 if %simplify%==0 echo Say "Blockback" to counter a back attack                                                                        (%vblockbackdmg% DMG)
if %hasitems% GEQ 1 echo Say "Items" to use an item
if %hasitems% LSS 1 echo Say "Shop" to buy items
if %snapped%==0 if %boss%==0 if %losestreak% GEQ 3 echo Say "SNAP" to SNAP at your opponent!
if %screen%==0 echo ==================================Previously===================================
if %screen%==1 echo =======================================================Previously=======================================================
if %dev%==1 echo Player Move: %pmove%, %pmove2%, %pmove3% : CPU Move: %cpumove%, %cpumove2%, %cpumove3%
if %dev%==1 echo CPU Anger: %sameattack%, %sameattack2%, %sameattack3%
if %dev%==1 echo Player Backmove: %backmove%, %backmove2%, %backmove3% : CPU Backmove: %cpubackmove%, %cpubackmove2%, %cpubackmove3%
if %dev%==1 echo Give XP: %givexp%
if %dev%==1 if %itemid% GTR 0 echo Item: F: %wpnitemface%, C: %wpnitemchest%, S: %wpnitemsweep%, B: %wpnitemback%
if %dev%==1 if %xpitemid% GTR 0 echo Item: F: %wpnitemface%, C: %wpnitemchest%, S: %wpnitemsweep%, B: %wpnitemback%
if %dev%==1 echo Special Move1: %specialmove1% : Special Move2: %specialmove2%
if %dev%==1 echo CRIT: %crit% ENCRIT: %encrit%
if %dev%==1 echo Player Countered: %countered1%, %countered2%, %countered3% : CPU Countered: %cpucountered1%, %cpucountered2%, %cpucountered3%
if %dev%==1 echo Stunned: %stunned% CPU Stunned: %cpustunned%, Rounds %stunnedrounds%, CpuRounds: %cpustunnedrounds%
if %dev%==1 echo Unstun: %unstun% CPU Unstun: %cpuunstun% StunRange: %stunrange% : CpuStunRange: %cpustunrange%
if %dev%==1 echo DMG LVL: %gamedamagelevel% CPU DMG LVL: %cpudamagelevel% / FORM: %form% CHANGE: %changeform%
if %dev%==1 echo Opponent 1: %opponent1%, Opponent 2: %opponent2%, Opponent 3: %opponent3%
if %dev%==1 if %screen%==0 echo ===============================================================================
if %dev%==1 if %screen%==1 echo ========================================================================================================================
if %class%==17 if %openingline%==0 echo Vampire: "Ah, I look forward to drinking your blood and destroying you!"
if %class%==17 if %changeform%==1 if %form%==2 echo Vampire: "Arg! You dare hurt me? I'll change forms and steal your life!"
if %class%==17 if %changeform%==1 if %form%==1 echo Vampire: "Ah, that's more how I like it, now prepare for more pain!"
if %boss%==2 if %openingline%==0 echo John: "You'll never defeat me and my three brothers!"
if %boss%==2 if %line%==1 echo John: "Hey! You step away from him! It's my turn now!"
if %boss%==2 if %line%==2 echo John: "I'll protect you brother!"
if %boss%==2 if %line%==3 echo Jonathan: "Make room for someone who actually knows what they're doing -.-"
if %boss%==2 if %line%==4 echo Jonathan: "Are they not fast enough for you?? I'll speed things up"
if %boss%==2 if %line%==5 echo Johnny: "HERE'S JOHNNY!"
if %boss%==2 if %line%==6 echo Johnny: "I'LL CUT YOU INTO A MILLION PIECES!"
if %class%==11 if %openingline%==0  if %form%==1 echo Thief: "Get outta my way, I'll give you $6 if you move now!"
if %class%==11 if %openingline%==0 if %form%==1 echo Say "Accept" to accept his bribe
if %class%==11 if %form%==1 if %line%==1 echo Thief: "Fine, I'll just have to make you move then!"
if %class%==11 if %form%==1 if %line%==2 echo Thief: "Not scared of my knife, eh? How about a gut knife!"
if %class%==11 if %form%==1 if %line%==3 echo Thief: "I see you're not a knife type of person. Let's try guns!"
if %class%==11 if %openingline%==0 if %form%==2 echo Cop: "You just let him get away? Ugh, I'll deal with you!"
if %class%==11 if %form%==2 if %specialmove1%==1 echo Cop: "Enough of this! Surrender!"
if %class%==15 if %openingline%==0 echo Snowman: "The shadow lord will have his way with you soon.."
if %class%==15 if %line%==1 echo Snowman: "Try not to bleed to much over there haha.."
if %class%==15 if %line%==2 echo Snowman: "Freeze for a second, you're moving too fast!!"
if %class%==15 if %line%==3 echo Snowman: "Hmm, let me get that for you.."
if %class%==15 if %line%==4 echo Snowman: "Oops, I think I made you bleed a bit.."
if %itembroke%==1 echo YOUR ITEM HAS BROKEN
if %itemshattered%==1 echo YOUR ITEM HAS BEEN SHATTERED!
if %cpuitemshattered%==1 echo YOU SHATTERED YOUR OPPONENTS ITEM!
if %dmgitem% GTR 0 echo DAMAGE ITEM DEALED %dmgitem% DMG
if %heal% GTR 0 echo You've been healed by %heal% HP
if %cpuheal% GTR 0 echo Opponent has been healed by %cpuheal% HP
if %xpitemid%==2 echo You've been given %givesxp% XP from reading a page from a champion's notebook
if %cpuslowrounds% GTR 0 echo Opponent slowed down! (%cpuslowrounds% ROUNDS LEFT)
if %slowrounds% GTR 0 echo You've been slowed down! (%slowrounds% ROUNDS LEFT)
if %cpudamage% GTR 0 if %crit%==1 echo YOU CRIT (2X DAMAGE)
if %damage% GTR 0 if %encrit%==1 echo YOUR OPPONENT CRIT (2X DAMAGE)
if %pmove%==1 if %countered1%==0 echo You hit your opponent in the face!
if %pmove%==2 if %countered1%==0 echo You hit your opponent in the chest!
if %pmove%==3 if %countered1%==0 echo You sweeped your opponent!
if %pmove%==4 if %backmove%==2 if %countered1%==0 echo You attempted to attack your opponent from behind and succeeded!
if %pmove%==4 if %backmove%==1 if %countered1%==0 echo You attempted to attack your opponent from behind but failed!
if %pmove%==1 if %countered1%==1 echo You tried to hit your opponent in the face! (COUNTERED)
if %pmove%==2 if %countered1%==1 echo You tried to hit your opponent in the chest! (COUNTERED)
if %pmove%==3 if %countered1%==1 echo You tried to sweep your opponent! (COUNTERED)
if %pmove%==4 if %backmove%==2 if %countered1%==1 echo You attempted to attack your opponent from behind and succeeded! (COUNTERED)
if %pmove%==4 if %backmove%==1 if %countered1%==1 echo You attempted to attack your opponent from behind but failed! (COUNTERED)
if %pmove%==5 if %cpucountered1%==0 echo You blocked your face!
if %pmove%==6 if %cpucountered1%==0 echo You blocked your chest!
if %pmove%==7 if %cpucountered1%==0 echo You blocked your feet!
if %pmove%==8 if %cpucountered1%==0 echo You blocked your back!
if %cpumove%==1 if %cpucountered1%==0 echo Your opponent hit you in the face!
if %cpumove%==2 if %cpucountered1%==0 echo Your opponent hit you in the chest! 
if %cpumove%==3 if %cpucountered1%==0 echo Your opponent sweeped you!
if %cpumove%==4 if %cpubackmove%==2 if %cpucountered1%==0 echo Your opponent attempted to attack you from behind and succeeded!
if %cpumove%==4 if %cpubackmove%==1 if %cpucountered1%==0 echo Your opponent attempted to attack you from behind and failed!
if %cpumove%==1 if %cpucountered1%==1 echo Your opponent tried to hit you in the face! (YOU COUNTERED)
if %cpumove%==2 if %cpucountered1%==1 echo Your opponent tried to hit you in the chest! (YOU COUNTERED)
if %cpumove%==3 if %cpucountered1%==1 echo Your opponent tried to sweep you! (YOU COUNTERED)
if %cpumove%==4 if %cpubackmove%==2 if %cpucountered1%==1 echo Your opponent attempted to attack you from behind and succeeded! (YOU COUNTERED)
if %cpumove%==4 if %cpubackmove%==1 if %cpucountered1%==1 echo Your opponent attempted to attack you from behind and failed! (YOU COUNTERED)
if %cpumove%==5 if %countered1%==0 echo Your opponent blocked their face!
if %cpumove%==6 if %countered1%==0 echo Your opponent blocked their chest!
if %cpumove%==7 if %countered1%==0 echo Your opponent blocked their feet!
if %cpumove%==8 if %countered1%==0 echo Your opponent blocked their back!

if %pmove2%==1 if %countered2%==0 echo SPEED 2: You hit your opponent in the face!
if %pmove2%==2 if %countered2%==0 echo SPEED 2: You hit your opponent in the chest!
if %pmove2%==3 if %countered2%==0 echo SPEED 2: You sweeped your opponent!
if %pmove2%==4 if %backmove2%==2 if %countered2%==0 echo SPEED 2: You attempted to attack your opponent from behind and succeeded!
if %pmove2%==4 if %backmove2%==1 if %countered2%==0 echo SPEED 2: You attempted to attack your opponent from behind but failed!
if %pmove2%==1 if %countered2%==1 echo SPEED 2: You tried to hit your opponent in the face! (COUNTERED)
if %pmove2%==2 if %countered2%==1 echo SPEED 2: You tried to hit your opponent in the chest! (COUNTERED)
if %pmove2%==3 if %countered2%==1 echo SPEED 2: You tried to sweep your opponent! (COUNTERED)
if %pmove2%==4 if %backmove2%==2 if %countered2%==1 echo SPEED 2: You attempted to attack your opponent from behind and succeeded! (COUNTERED)
if %pmove2%==4 if %backmove2%==1 if %countered2%==1 echo SPEED 2: You attempted to attack your opponent from behind but failed! (COUNTERED)
if %pmove2%==5 if %cpucountered2%==0 echo SPEED 2: You blocked your face!
if %pmove2%==6 if %cpucountered2%==0 echo SPEED 2: You blocked your chest!
if %pmove2%==7 if %cpucountered2%==0 echo SPEED 2: You blocked your feet!
if %pmove2%==8 if %cpucountered2%==0 echo SPEED 2: You blocked your back!
if %cpumove2%==1 if %cpucountered2%==0 echo SPEED 2: Your opponent hit you in the face!
if %cpumove2%==2 if %cpucountered2%==0 echo SPEED 2: Your opponent hit you in the chest! 
if %cpumove2%==3 if %cpucountered2%==0 echo SPEED 2: Your opponent sweeped you!
if %cpumove2%==4 if %cpubackmove2%==2 if %cpucountered2%==0 echo SPEED 2: Your opponent attempted to attack you from behind and succeeded!
if %cpumove2%==4 if %cpubackmove2%==1 if %cpucountered2%==0 echo SPEED 2: Your opponent attempted to attack you from behind and failed!
if %cpumove2%==1 if %cpucountered2%==1 echo SPEED 2: Your opponent tried to hit you in the face! (YOU COUNTERED)
if %cpumove2%==2 if %cpucountered2%==1 echo SPEED 2: Your opponent tried to hit you in the chest! (YOU COUNTERED)
if %cpumove2%==3 if %cpucountered2%==1 echo SPEED 2: Your opponent tried to sweep you! (YOU COUNTERED)
if %cpumove2%==4 if %cpubackmove2%==2 if %cpucountered2%==1 echo SPEED 2: Your opponent attempted to attack you from behind and succeeded! (YOU COUNTERED)
if %cpumove2%==4 if %cpubackmove2%==1 if %cpucountered2%==1 echo SPEED 2: Your opponent attempted to attack you from behind and failed! (YOU COUNTERED)
if %cpumove2%==5 if %countered2%==0 echo SPEED 2: Your opponent blocked their face!
if %cpumove2%==6 if %countered2%==0 echo SPEED 2: Your opponent blocked their chest!
if %cpumove2%==7 if %countered2%==0 echo SPEED 2: Your opponent blocked their feet!
if %cpumove2%==8 if %countered2%==0 echo SPEED 2: Your opponent blocked their back!

if %pmove3%==1 if %countered3%==0 echo SPEED 3: You hit your opponent in the face!
if %pmove3%==2 if %countered3%==0 echo SPEED 3: You hit your opponent in the chest!
if %pmove3%==3 if %countered3%==0 echo SPEED 3: You sweeped your opponent!
if %pmove3%==4 if %backmove3%==2 if %countered3%==0 echo SPEED 3: You attempted to attack your opponent from behind and succeeded!
if %pmove3%==4 if %backmove3%==1 if %countered3%==0 echo SPEED 3: You attempted to attack your opponent from behind but failed!
if %pmove3%==1 if %countered3%==1 echo SPEED 3: You tried to hit your opponent in the face! (COUNTERED)
if %pmove3%==2 if %countered3%==1 echo SPEED 3: You tried to hit your opponent in the chest! (COUNTERED)
if %pmove3%==3 if %countered3%==1 echo SPEED 3: You tried to sweep your opponent! (COUNTERED)
if %pmove3%==4 if %backmove3%==2 if %countered3%==1 echo SPEED 3: You attempted to attack your opponent from behind and succeeded! (COUNTERED)
if %pmove3%==4 if %backmove3%==1 if %countered3%==1 echo SPEED 3: You attempted to attack your opponent from behind but failed! (COUNTERED)
if %pmove3%==5 if %cpucountered3%==0 echo SPEED 3: You blocked your face!
if %pmove3%==6 if %cpucountered3%==0 echo SPEED 3: You blocked your chest!
if %pmove3%==7 if %cpucountered3%==0 echo SPEED 3: You blocked your feet!
if %pmove3%==8 if %cpucountered3%==0 echo SPEED 3: You blocked your back!
if %cpumove3%==1 if %cpucountered3%==0 echo SPEED 3: Your opponent hit you in the face!
if %cpumove3%==2 if %cpucountered3%==0 echo SPEED 3: Your opponent hit you in the chest! 
if %cpumove3%==3 if %cpucountered3%==0 echo SPEED 3: Your opponent sweeped you!
if %cpumove3%==4 if %cpubackmove3%==2 if %cpucountered3%==0 echo SPEED 3: Your opponent attempted to attack you from behind and succeeded!
if %cpumove3%==4 if %cpubackmove3%==1 if %cpucountered3%==0 echo SPEED 3: Your opponent attempted to attack you from behind and failed!
if %cpumove3%==1 if %cpucountered3%==1 echo SPEED 3: Your opponent tried to hit you in the face! (YOU COUNTERED)
if %cpumove3%==2 if %cpucountered3%==1 echo SPEED 3: Your opponent tried to hit you in the chest! (YOU COUNTERED)
if %cpumove3%==3 if %cpucountered3%==1 echo SPEED 3: Your opponent tried to sweep you! (YOU COUNTERED)
if %cpumove3%==4 if %cpubackmove3%==2 if %cpucountered3%==1 echo SPEED 3: Your opponent attempted to attack you from behind and succeeded! (YOU COUNTERED)
if %cpumove3%==4 if %cpubackmove3%==1 if %cpucountered3%==1 echo SPEED 3: Your opponent attempted to attack you from behind and failed! (YOU COUNTERED)
if %cpumove3%==5 if %countered3%==0 echo SPEED 3: Your opponent blocked their face!
if %cpumove3%==6 if %countered3%==0 echo SPEED 3: Your opponent blocked their chest!
if %cpumove3%==7 if %countered3%==0 echo SPEED 3: Your opponent blocked their feet!
if %cpumove3%==8 if %countered3%==0 echo SPEED 3: Your opponent blocked their back!
if %boss%==1 if %specialmove1%==1 echo Marax used his special ability "Breathless"! (20 DMG AND CANCELS YOUR SPEED 2 AND 3 MOVES)
if %class%==13 if %specialmove1%==1 echo HITMAN USED SPECIAL ABILITY "PERFECT" AND COUNTERED ALL YOUR MOVES
if %class%==13 if %specialmove2%==1 echo HITMAN SHOT YOU (LOSE 12 HP AND CANCELS YOUR SPEED 2 AND 3 MOVES)
if %class%==15 if %specialmove1%==1 echo Your opponent threw an ice cube at you! (8 DMG, 30 PERCENT STUN, AND SLOWED DOWN FOR 4 TURNS)
if %class%==15 if %specialmove2%==1 echo Your opponent froze your blood and shattered it! (GUARANTEED CRIT)
if %specialmove2%==1 if %form%==1 if %class%==11 echo THIEF SHOT YOU (DEALS 25 DMG)
if %specialmove1%==1 if %form%==2 if %class%==11 echo COP TASED YOU (STUNS YOU)
if %specialmove1%==1 if %class%==16 echo Werewolf used a special ability "Howl"! (-1 DMG LVL, +1 DMG LVL FOR OPPONENT)
if %specialmove1%==1 if %wizard%==1 echo Your opponent used a special attack "Fireball"! (12 DMG, DOUBLES ON LOW HP)
if %specialmove2%==1 if %wizard%==1 echo Your opponent used a special attack "Lightning Strike"! (50 DMG)
if %specialmove3%==1 if %wizard%==1 echo Your opponent healed themself!
if %cpustunned%==1 echo OPPONENT STUNNED!
if %opponentsleft%==0 if %health% LSS 1 if %cpuhealth% LSS 1 (
color c
timeout 2 /nobreak >nul
timeout 1 >nul
color a
goto Tied
)
if %health% LSS 1 (
color c
echo You've been defeated
timeout 2 /nobreak >nul
echo Press anything to continue...
timeout 300 >nul
color a
goto Defeated
)
if %cpuhealth% LSS 1 (
color e
timeout 2 /nobreak >nul
timeout 1 >nul
color a
goto Win
)
if %stunned%==1 (
timeout 2 /nobreak >nul
echo STUNNED!
timeout 2 >nul
set /a move=0
set /a move2=0
set /a move3=0
if %stunnedrounds% LEQ 1 pause
goto GameValidAttack
)
set /p move=
if %boss%==0 if %losestreak% GEQ 3 if /i "%move%"=="SNAP" set /a critrange=(24-%level%)/3
if %boss%==0 if %losestreak% GEQ 3 if /i "%move%"=="SNAP" if %snapped%==0 (
set /a gamedamagelevel=%gamedamagelevel%+2
set /a resist=25
set /a snapped=1
set /a givexp=40-%level%
set /a refreshed=1
goto Game
)
if %dev%==1 if "%move%"=="Stun123" (
set /a ocpustunrange=0
set /a cpustunned=1
set /a cpustunnedrounds=0
)
if %dev%==1 if "%move%"=="Stunned" (
set /a ostunrange=0
set /a stunned=1
set /a stunnedrounds=0
)
if %dev%==1 if "%move%"=="ENTER_DEV_CMD" goto CMD
if /i "%move%"=="Items" goto ItemCheck
if /i "%move%"=="Shop" (
set /a icr=3
set /a icr2=1
 goto Shop
)
if /i "%move%"=="Inv" goto ItemCheck
if /i "%move%"=="Face" set /a move=1
if /i "%move%"=="Chest" set /a move=2
if /i "%move%"=="Sweep" set /a move=3
if /i "%move%"=="Back" set /a move=4
if /i "%move%"=="Blockface" set /a move=5
if /i "%move%"=="Blockchest" set /a move=6
if /i "%move%"=="Blocksweep" set /a move=7
if /i "%move%"=="Blockback" set /a move=8
if /i "%move%"=="Quit" goto AreYouSure
if /i "%move%"=="Exit" goto AreYouSure
if %openingline%==0 if %class%==11 if %form%==1 if /i "%move%"=="Accept" goto CPUThief2Class
if "%move%" GEQ "1" if "%move%" LEQ "8" set /a validmove=1
if %validmove%==0 (
set /a itemmenu=6
goto UseItemCheck
)
:GameItemResume
if %validmove%==0 goto GameInvalidAttack
if %gamespeedlevel%==1 goto GameValidAttack
if %gamespeedlevel% GEQ 2 echo Now enter your second move!
if %gamespeedlevel% GEQ 2 set /p move2=
if /i "%move2%"=="Face" set /a move2=1
if /i "%move2%"=="Chest" set /a move2=2
if /i "%move2%"=="Sweep" set /a move2=3
if /i "%move2%"=="Back" set /a move2=4
if /i "%move2%"=="Blockface" set /a move2=5
if /i "%move2%"=="Blockchest" set /a move2=6
if /i "%move2%"=="Blocksweep" set /a move2=7
if /i "%move2%"=="Blockback" set /a move2=8
if %move2% GEQ 1 if %move2% LEQ 8 set /a validmove2=1
if %validmove2%==0 goto GameInvalidAttack
if %gamespeedlevel%==2 goto GameValidAttack
if %gamespeedlevel%==3 echo Now enter your third move!
if %gamespeedlevel%==3 set /p move3=
if /i "%move3%"=="Face" set /a move3=1
if /i "%move3%"=="Chest" set /a move3=2
if /i "%move3%"=="Sweep" set /a move3=3
if /i "%move3%"=="Back" set /a move3=4
if /i "%move3%"=="Blockface" set /a move3=5
if /i "%move3%"=="Blockchest" set /a move3=6
if /i "%move3%"=="Blocksweep" set /a move3=7
if /i "%move3%"=="Blockback" set /a move3=8
if %move3% GEQ 1 if %move3% LEQ 8 set /a validmove3=1
if %validmove3%==0 goto GameInvalidAttack
goto GameValidAttack

:AreYouSure
cls
echo Are you sure you'd like to quit?
echo This will be counted as a defeat and you won't gain any rewards from this fight
set /p input=
if /i "%input%"=="Yes" set /a totaldefeats=%totaldefeats%+1
if /i "%input%"=="Yes" (
if %statson%==1 echo %totaldefeats% > "%cd%\data\td.data"
goto Menu
)
if /i "%input%"=="No" goto Game
echo Please say "Yes" or "No"
pause
goto AreYouSure

:GameInvalidAttack
if "%move%"=="Dev" set /a dev=1
if "%move%"=="Undev" set /a dev=0
if %dev%==1 if "%move%"=="RunCMD" goto CMD
echo That wasnt a option try again
pause
goto Game

:CMD
cls
set /p command=
%command%
goto Game

:GameValidAttack
color a
cls
echo Loading...
set /a line=0
if %class%==11 if %openingline%==0 if %form%==1 set /a line=1
if %xpitemid%==2 set /a xpitemid=0
set /a openingline=1
set /a ran=0
set /a defeatedopponent=0
set /a dmgitem=0
set /a heal=0
set /a cpuheal=0
set /a cpumove=0
set /a cpumove2=0
set /a cpumove3=0
set /a trigger1=0
set /a trigger2=0
set /a trigger3=0
set /a itembroke=0
set /a refreshed=1
set /a crit=0
set /a encrit=0
set /a itemshattered=0
set /a cpuitemshattered=0

if NOT %cpuslowrounds%==0 set /a trigger1=1
if %trigger1%==1 set /a cpuslowrounds=%cpuslowrounds%-1
if %trigger1%==1 if %cpuslowrounds%==0 set /a cpuspeedlevel=%cpuspeedlevel%+1

if NOT %slowrounds%==0 set /a trigger2=1
if %trigger2%==1 set /a slowrounds=%slowrounds%-1
if %trigger2%==1 if %slowrounds%==0 set /a gamespeedlevel=%gamespeedlevel%+1
set /a trigger1=0
set /a trigger2=0
::Deals with round timers

if %cpustunned%==0 (
set /a cpumove=%random%*8/32767+1
if %cpucb%==0 set /a cpumove=%random%*4/32767+1
if %cpuspeedlevel% GEQ 2 if %gamespeedlevel% GEQ 2 set /a cpumove2=%random%*8/32767+1
if %cpuspeedlevel% GEQ 3 if %gamespeedlevel% GEQ 3 set /a cpumove2=%random%*8/32767+1
if %gamespeedlevel% LSS 2 if %cpuspeedlevel% GEQ 2 set /a cpumove2=1
if %gamespeedlevel% LSS 3 if %cpuspeedlevel%==3 set /a cpumove3=1
)

set /a dropmoneyamount=1
if %level% GEQ 7 set /a dropmoneyamount=%random%*2/32767+1
if %level% GEQ 13 set /a dropmoneyamount=%random%*3/32767+1
if %level% GEQ 16 set /a dropmoneyamount=%random%*4/32767+1
:: Determines how much will drop if money is dropped ^^
if %money% LEQ 20 set /a dropmoney=%random%*4/32767+1
if %money% LEQ 30 set /a dropmoney=%random%*5/32767+1
if %money% LEQ 40 set /a dropmoney=%random%*6/32767+1
if %money% LEQ 50 set /a dropmoney=%random%*7/32767+1
if %money% GTR 50 set /a dropmoney=%random%*8/32767+1
:: Lowers chance of getting money if you already have money stored up
if %move% GTR 4 set /a dropmoney=%random%*8/32767+1
if %move% GTR 4 if %cpucountered1%==1 set /a dropmoney=%random%*2/32767+1
if %move2% GTR 4 if %cpucountered2%==1 if NOT %dropmoney%==1 set /a dropmoney=%random%*2/32767+1
if %move3% GTR 4 if %cpucountered3%==1 if NOT %dropmoney%==1 set /a dropmoney=%random%*2/327267+1
if %dropmoney%==1 set /a givemoney=%givemoney%+%dropmoneyamount%

set /a damage=0
set /a bleedingdamage=0
set /a cpudamage=0
set /a cpubleedingdamage=0
set /a backmove=%random%*2/32767+1
set /a backmove2=%random%*2/32767+1
set /a backmove3=%random%*2/32767+1
set /a cpubackmove=%random%*2/32767+1
set /a cpubackmove2=%random%*2/32767+1
set /a cpubackmove3=%random%*2/32767+1

if %cpustunned%==1 (
set /a pmove=%move%
set /a pmove2=%move2%
set /a pmove3=%move3%
goto GameValidAttack004
)
if %cpucb%==0 goto GameValidAttack001
if %sameattack% LSS 3 goto GameValidAttack001
if %sameattack%==3 set /a think=%random%*5/32767+1
if %sameattack%==3 if %think%==1 if %pmove%==1 set /a cpumove=5
if %sameattack%==3 if %think%==1 if %pmove%==2 set /a cpumove=6
if %sameattack%==3 if %think%==1 if %pmove%==3 set /a cpumove=7
if %sameattack%==3 if %think%==1 if %pmove%==4 set /a cpumove=8
if %sameattack%==3 if %think%==1 if %pmove%==5 set /a cpumove=2
if %sameattack%==3 if %think%==1 if %pmove%==6 set /a cpumove=1
if %sameattack%==3 if %think%==1 if %pmove%==7 set /a cpumove=1
if %sameattack%==3 if %think%==1 if %pmove%==8 set /a cpumove=1

if %sameattack%==4 set /a think=%random%*4/32767+1
if %sameattack%==4 if %think%==1 if %pmove%==1 set /a cpumove=5
if %sameattack%==4 if %think%==1 if %pmove%==2 set /a cpumove=6
if %sameattack%==4 if %think%==1 if %pmove%==3 set /a cpumove=7
if %sameattack%==4 if %think%==1 if %pmove%==4 set /a cpumove=8
if %sameattack%==4 if %think%==1 if %pmove%==5 set /a cpumove=2
if %sameattack%==4 if %think%==1 if %pmove%==6 set /a cpumove=1
if %sameattack%==4 if %think%==1 if %pmove%==7 set /a cpumove=1
if %sameattack%==4 if %think%==1 if %pmove%==8 set /a cpumove=1

if %sameattack%==5 set /a think=%random%*3/32767+1
if %sameattack%==5 if %think%==1 if %pmove%==1 set /a cpumove=5
if %sameattack%==5 if %think%==1 if %pmove%==2 set /a cpumove=6
if %sameattack%==5 if %think%==1 if %pmove%==3 set /a cpumove=7
if %sameattack%==5 if %think%==1 if %pmove%==4 set /a cpumove=8
if %sameattack%==5 if %think%==1 if %pmove%==5 set /a cpumove=2
if %sameattack%==5 if %think%==1 if %pmove%==6 set /a cpumove=1
if %sameattack%==5 if %think%==1 if %pmove%==7 set /a cpumove=1
if %sameattack%==5 if %think%==1 if %pmove%==8 set /a cpumove=1

if %sameattack% GEQ 6 set /a think=%random%*2/32767+1
if %sameattack% GEQ 6 if %think%==1 if %pmove%==1 set /a cpumove=5
if %sameattack% GEQ 6 if %think%==1 if %pmove%==2 set /a cpumove=6
if %sameattack% GEQ 6 if %think%==1 if %pmove%==3 set /a cpumove=7
if %sameattack% GEQ 6 if %think%==1 if %pmove%==4 set /a cpumove=8
if %sameattack% GEQ 6 if %think%==1 if %pmove%==5 set /a cpumove=2
if %sameattack% GEQ 6 if %think%==1 if %pmove%==6 set /a cpumove=1
if %sameattack% GEQ 6 if %think%==1 if %pmove%==7 set /a cpumove=1
if %sameattack% GEQ 6 if %think%==1 if %pmove%==8 set /a cpumove=1
::This code here ^^ asks the CPU if it'd like to change it's move due to spam attacking (CPU Speed 1)
:GameValidAttack001
if %move%==%pmove% set /a sameattack=%sameattack%+1
if %move%==9 set /a sameattack=%sameattack%+1
if NOT %move%==%pmove% if %sameattack% GEQ 7 set /a sameattack=%sameattack%-4
if NOT %move%==%pmove% if %sameattack% LEQ 6 if %sameattack% GTR 1 set /a sameattack=%sameattack%-2
set /a pmove=%move%

if %cpucb%==0 goto GameValidAttack002
if %sameattack2% LSS 3 goto GameValidAttack002
if %cpuspeedlevel% GEQ 2 (
if %sameattack2%==3 set /a think=%random%*5/32767+1
if %sameattack2%==3 if %think%==1 if %pmove2%==1 set /a cpumove2=5
if %sameattack2%==3 if %think%==1 if %pmove2%==2 set /a cpumove2=6
if %sameattack2%==3 if %think%==1 if %pmove2%==3 set /a cpumove2=7
if %sameattack2%==3 if %think%==1 if %pmove2%==4 set /a cpumove2=8
if %sameattack2%==3 if %think%==1 if %pmove2%==5 set /a cpumove2=2
if %sameattack2%==3 if %think%==1 if %pmove2%==6 set /a cpumove2=1
if %sameattack2%==3 if %think%==1 if %pmove2%==7 set /a cpumove2=1
if %sameattack2%==3 if %think%==1 if %pmove2%==8 set /a cpumove2=1

if %sameattack2%==4 set /a think=%random%*4/32767+1
if %sameattack2%==4 if %think%==1 if %pmove2%==1 set /a cpumove2=5
if %sameattack2%==4 if %think%==1 if %pmove2%==2 set /a cpumove2=6
if %sameattack2%==4 if %think%==1 if %pmove2%==3 set /a cpumove2=7
if %sameattack2%==4 if %think%==1 if %pmove2%==4 set /a cpumove2=8
if %sameattack2%==4 if %think%==1 if %pmove2%==5 set /a cpumove2=2
if %sameattack2%==4 if %think%==1 if %pmove2%==6 set /a cpumove2=1
if %sameattack2%==4 if %think%==1 if %pmove2%==7 set /a cpumove2=1
if %sameattack2%==4 if %think%==1 if %pmove2%==8 set /a cpumove2=1

if %sameattack2%==5 set /a think=%random%*3/32767+1
if %sameattack2%==5 if %think%==1 if %pmove2%==1 set /a cpumove2=5
if %sameattack2%==5 if %think%==1 if %pmove2%==2 set /a cpumove2=6
if %sameattack2%==5 if %think%==1 if %pmove2%==3 set /a cpumove2=7
if %sameattack2%==5 if %think%==1 if %pmove2%==4 set /a cpumove2=8
if %sameattack2%==5 if %think%==1 if %pmove2%==5 set /a cpumove2=2
if %sameattack2%==5 if %think%==1 if %pmove2%==6 set /a cpumove2=1
if %sameattack2%==5 if %think%==1 if %pmove2%==7 set /a cpumove2=1
if %sameattack2%==5 if %think%==1 if %pmove2%==8 set /a cpumove2=1

if %sameattack2% GEQ 6 set /a think=%random%*2/32767+1
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==1 set /a cpumove2=5
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==2 set /a cpumove2=6
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==3 set /a cpumove2=7
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==4 set /a cpumove2=8
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==5 set /a cpumove2=2
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==6 set /a cpumove2=1
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==7 set /a cpumove2=1
if %sameattack2% GEQ 6 if %think%==1 if %pmove2%==8 set /a cpumove2=1
)
if %gamespeedlevel%==1 set /a sameattack2=0
::This code here ^^ asks the CPU if it'd like to change it's move due to spam attacking (CPU Speed 2)
:GameValidAttack002
if %gamespeedlevel% GEQ 2 if %move2%==%pmove2% set /a sameattack2=%sameattack2%+1
if %gamespeedlevel% GEQ 2 if NOT %move2%==%pmove2% if %sameattack2% GEQ 7 set /a sameattack2=%sameattack2%-4
if %gamespeedlevel% GEQ 2 if NOT %move2%==%pmove2% if %sameattack2% LEQ 6 if %sameattack2% GTR 1 set /a sameattack2=%sameattack2%-2
if %gamespeedlevel% GEQ 2 set /a pmove2=%move2%
if /i "%move3%"=="Face" set /a move3=1
if /i "%move3%"=="Chest" set /a move3=2
if /i "%move3%"=="Sweep" set /a move3=3
if /i "%move3%"=="Back" set /a move3=4
if /i "%move3%"=="Blockface" set /a move3=5
if /i "%move3%"=="Blockchest" set /a move3=6
if /i "%move3%"=="Blocksweep" set /a move3=7
if /i "%move3%"=="Blockback" set /a move3=8

if %cpucb%==0 goto GameValidAttack004
if %sameattack% LSS 3 goto GameValidAttack003
if %cpuspeedlevel%==3 (
if %sameattack3%==3 set /a think=%random%*5/32767+1
if %sameattack3%==3 if %think%==1 if %pmove3%==1 set /a cpumove3=5
if %sameattack3%==3 if %think%==1 if %pmove3%==2 set /a cpumove3=6
if %sameattack3%==3 if %think%==1 if %pmove3%==3 set /a cpumove3=7
if %sameattack3%==3 if %think%==1 if %pmove3%==4 set /a cpumove3=8
if %sameattack3%==3 if %think%==1 if %pmove3%==5 set /a cpumove3=2
if %sameattack3%==3 if %think%==1 if %pmove3%==6 set /a cpumove3=1
if %sameattack3%==3 if %think%==1 if %pmove3%==7 set /a cpumove3=1
if %sameattack3%==3 if %think%==1 if %pmove3%==8 set /a cpumove3=1

if %sameattack3%==4 set /a think=%random%*4/33767+1
if %sameattack3%==4 if %think%==1 if %pmove3%==1 set /a cpumove3=5
if %sameattack3%==4 if %think%==1 if %pmove3%==2 set /a cpumove3=6
if %sameattack3%==4 if %think%==1 if %pmove3%==3 set /a cpumove3=7
if %sameattack3%==4 if %think%==1 if %pmove3%==4 set /a cpumove3=8
if %sameattack3%==4 if %think%==1 if %pmove3%==5 set /a cpumove3=2
if %sameattack3%==4 if %think%==1 if %pmove3%==6 set /a cpumove3=1
if %sameattack3%==4 if %think%==1 if %pmove3%==7 set /a cpumove3=1
if %sameattack3%==4 if %think%==1 if %pmove3%==8 set /a cpumove3=1

if %sameattack3%==5 set /a think=%random%*3/33767+1
if %sameattack3%==5 if %think%==1 if %pmove3%==1 set /a cpumove3=5
if %sameattack3%==5 if %think%==1 if %pmove3%==2 set /a cpumove3=6
if %sameattack3%==5 if %think%==1 if %pmove3%==3 set /a cpumove3=7
if %sameattack3%==5 if %think%==1 if %pmove3%==4 set /a cpumove3=8
if %sameattack3%==5 if %think%==1 if %pmove3%==5 set /a cpumove3=2
if %sameattack3%==5 if %think%==1 if %pmove3%==6 set /a cpumove3=1
if %sameattack3%==5 if %think%==1 if %pmove3%==7 set /a cpumove3=1
if %sameattack3%==5 if %think%==1 if %pmove3%==8 set /a cpumove3=1

if %sameattack3% GEQ 6 set /a think=%random%*2/33767+1
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==1 set /a cpumove3=5
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==2 set /a cpumove3=6
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==3 set /a cpumove3=7
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==4 set /a cpumove3=8
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==5 set /a cpumove3=2
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==6 set /a cpumove3=1
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==7 set /a cpumove3=1
if %sameattack3% GEQ 6 if %think%==1 if %pmove3%==8 set /a cpumove3=1
)
if %gamespeedlevel% LSS 3 set /a sameattack3=0
::This code here ^^ asks the CPU if it'd like to change it's move due to spam attacking (CPU Speed 3)
:GameValidAttack003
if NOT %class%==13 goto GameValidAttack004
set /a specialmove1=%random%*10/32767+1
if %level% GEQ 11 set /a specialmove1=%random%*5/32767+1
if %specialmove1%==1 if %move%==1 set /a cpumove=5
if %specialmove1%==1 if %move%==2 set /a cpumove=6
if %specialmove1%==1 if %move%==3 set /a cpumove=7
if %specialmove1%==1 if %move%==4 set /a cpumove=8
if %specialmove1%==1 if %move%==5 set /a cpumove=2
if %specialmove1%==1 if %move%==6 set /a cpumove=1
if %specialmove1%==1 if %move%==7 set /a cpumove=1
if %specialmove1%==1 if %move%==8 set /a cpumove=1

if %specialmove1%==1 if %move2%==1 set /a cpumove2=5
if %specialmove1%==1 if %move2%==2 set /a cpumove2=6
if %specialmove1%==1 if %move2%==3 set /a cpumove2=7
if %specialmove1%==1 if %move2%==4 set /a cpumove2=8
if %specialmove1%==1 if %move2%==5 set /a cpumove2=2
if %specialmove1%==1 if %move2%==6 set /a cpumove2=1
if %specialmove1%==1 if %move2%==7 set /a cpumove2=1
if %specialmove1%==1 if %move2%==8 set /a cpumove2=1

if %specialmove1%==1 if %move3%==1 set /a cpumove3=5
if %specialmove1%==1 if %move3%==2 set /a cpumove3=6
if %specialmove1%==1 if %move3%==3 set /a cpumove3=7
if %specialmove1%==1 if %move3%==4 set /a cpumove3=8
if %specialmove1%==1 if %move3%==5 set /a cpumove3=2
if %specialmove1%==1 if %move3%==6 set /a cpumove3=1
if %specialmove1%==1 if %move3%==7 set /a cpumove3=1
if %specialmove1%==1 if %move3%==8 set /a cpumove3=1
::The code above this line ^^ says that if the class is Hitman and they score a perfect, they'll use it basically.
:GameValidAttack004
if %stunned%==1 set /a cpumove=1
if %stunned%==1 if %cpuspeedlevel% GEQ 2 set /a cpumove2=1
if %stunned%==1 if %cpuspeedlevel% GEQ 3 set /a cpumove3=1
if %gamedamagelevel% LSS 0 set /a gamedamagelevel=0
if %gamespeedlevel% GEQ 3 if %move3%==%pmove3% set /a sameattack3=%sameattack3%+1
if %gamespeedlevel% GEQ 3 if NOT %move3%==%pmove3% if %sameattack3% GEQ 7 set /a sameattack3=%sameattack3%-4
if %gamespeedlevel% GEQ 3 if %sameattack3% GEQ 7 set /a sameattack3=%sameattack3%-4
if %gamespeedlevel% GEQ 3 if NOT %move3%==%pmove3% if %sameattack3% LEQ 6 if %sameattack3% GTR 1 set /a sameattack3=%sameattack3%-2
set /a pmove3=%move3%
:: Gives extra XP for everything but counters
set /a movexp=%random%*2/32767+1
if %move%==1 set /a givexp=%givexp%+%efacexp%
if %move%==2 set /a givexp=%givexp%+%echestxp%
if %move%==3 set /a givexp=%givexp%+%esweepxp%
if %move%==4 if %backmove%==2 set /a givexp=%givexp%+%ebackxp%
if %move%==4 if %backmove%==1 set /a givexp=%givexp%+%ebackxp%
if %level%==1 (
if %move%==1 set /a givexp=%givexp%+2
if %move%==2 set /a givexp=%givexp%+2
if %move%==3 set /a givexp=%givexp%+3
if %move%==4 if %backmove%==2 set /a givexp=%givexp%+4
if %move%==4 if %backmove%==1 set /a givexp=%givexp%+2
)
if %level%==2 (
if %move%==1 set /a givexp=%givexp%+1
if %move%==2 set /a givexp=%givexp%+2
if %move%==3 set /a givexp=%givexp%+3
if %move%==4 if %backmove%==2 set /a givexp=%givexp%+3
if %move%==4 if %backmove%==1 set /a givexp=%givexp%+2
)
if %level%==3 (
if %move%==1 set /a givexp=%givexp%+1
if %move%==2 set /a givexp=%givexp%+1
if %move%==3 set /a givexp=%givexp%+2
if %move%==4 if %backmove%==2 set /a givexp=%givexp%+3
if %move%==4 if %backmove%==1 set /a givexp=%givexp%+1
)
if %level%==4 (
if %movexp%==1 if %move%==1 set /a givexp=%givexp%+1
if %move%==2 set /a givexp=%givexp%+1
if %move%==3 set /a givexp=%givexp%+2
if %move%==4 if %backmove%==2 set /a givexp=%givexp%+2
if %movexp%==1 if %move%==4 if %backmove%==1 set /a givexp=%givexp%+1
)
if %level% GEQ 5 if %level% LEQ 8 (
if %movexp%==1 if %move%==1 set /a givexp=%givexp%+1
if %movexp%==1 if %move%==2 set /a givexp=%givexp%+1
if %move%==3 set /a givexp=%givexp%+2
if %move%==4 if %backmove%==2 set /a givexp=%givexp%+2
if %movexp%==1 if %move%==4 if %backmove%==1 set /a givexp=%givexp%+1
)
if %level% GTR 8 (
if %movexp%==1 if %move%==1 set /a givexp=%givexp%+1
if %movexp%==1 if %move%==2 set /a givexp=%givexp%+1
if %move%==3 set /a givexp=%givexp%+1
if %move%==4 if %backmove%==2 set /a givexp=%givexp%+1
if %movexp%==1 if %move%==4 if %backmove%==1 set /a givexp=%givexp%+1
)
:GameValidAttack004Hitman
if NOT %class%==13 goto GameValidAttack004Marax
set /a specialmove2=%random%*8/32767+1
if %level% GEQ 11 set /a specialmove2=%random%*4/32767+1
if %sameattack2% GEQ 4 set /a specialmove2=1
if %sameattack3% GEQ 4 set /a specialmove2=1
if %specialmove2%==1 (
set /a damage=%damage%+12
set /a move2=0
set /a move3=0
)
::The code above will make the hitman randomly shoot you or if you spam your 3rd speed it'll also shoot.
::This MUST be placed here or else you can get stuns on hitman w/ moves he canceled!
:GameValidAttack004Marax
if NOT %boss%==1 goto GameValidAttack004Stun
set /a specialmove1=%random%*8/33767+1
if %sameattack2% GEQ 3 set /a specialmove1=1
if %sameattack3% GEQ 3 set /a specialmove1=1
if %specialmove1%==1 set /a damage=%damage%+20
if %specialmove1%==1 set /a move2=0
if %specialmove1%==1 set /a move3=0
::This code above ^^ is the code for the boss Marax
:GameValidAttack004Stun
set /a cpucountered1=0
set /a cpucountered2=0
set /a cpucountered3=0
set /a countered1=0
set /a countered2=0
set /a countered3=0
if %move%==5 if %cpumove%==1 set /a cpucountered1=1
if %move%==6 if %cpumove%==2 set /a cpucountered1=1
if %move%==7 if %cpumove%==3 set /a cpucountered1=1
if %move%==8 if %cpumove%==4 set /a cpucountered1=1
if %move2%==5 if %cpumove2%==1 set /a cpucountered2=1
if %move2%==6 if %cpumove2%==2 set /a cpucountered2=1
if %move2%==7 if %cpumove2%==3 set /a cpucountered2=1
if %move2%==8 if %cpumove2%==4 set /a cpucountered2=1
if %move3%==5 if %cpumove3%==1 set /a cpucountered3=1
if %move3%==6 if %cpumove3%==2 set /a cpucountered3=1
if %move3%==7 if %cpumove3%==3 set /a cpucountered3=1
if %move3%==8 if %cpumove3%==4 set /a cpucountered3=1
if %cpumove%==5 if %move%==1 set /a countered1=1
if %cpumove%==6 if %move%==2 set /a countered1=1
if %cpumove%==7 if %move%==3 set /a countered1=1
if %cpumove%==8 if %move%==4 set /a countered1=1
if %cpumove2%==5 if %move2%==1 set /a countered2=1
if %cpumove2%==6 if %move2%==2 set /a countered2=1
if %cpumove2%==7 if %move2%==3 set /a countered2=1
if %cpumove2%==8 if %move2%==4 set /a countered2=1
if %cpumove3%==5 if %move3%==1 set /a countered3=1
if %cpumove3%==6 if %move3%==2 set /a countered3=1
if %cpumove3%==7 if %move3%==3 set /a countered3=1
if %cpumove3%==8 if %move3%==4 set /a countered3=1

set /a stun=%random%*20/32767+1
if %move%==3 if %cpustunned%==0 if %countered1%==0 (
if %stun%==1 set /a ocpustunrange=15
if %stun%==1 set /a cpustunned=1
if %stun%==1 set /a cpustunnedrounds=0
)

set /a stun=%random%*20/32767+1
if %move2%==3 if %cpustunned%==0 if %countered2%==0 if %stun%==1 (
set /a ocpustunrange=15
set /a cpustunned=1
set /a cpustunnedrounds=0
)

set /a stun=%random%*20/32767+1
if %move3%==3 if %cpustunned%==0 if %countered3%==0 if %stun%==1 (
set /a ocpustunrange=15
set /a cpustunned=1
set /a cpustunnedrounds=0
)

set /a stun=%random%*10/32767+1
if %move%==4 if %backmove%==2 if %cpustunned%==0 if %countered1%==0 if %stun%==1 (
set /a ocpustunrange=12
set /a cpustunned=1
set /a cpustunnedrounds=0
)

set /a stun=%random%*10/32767+1
if %move2%==4 if %backmove2%==2 if %cpustunned%==0 if %countered2%==0 if %stun%==1 (
set /a ocpustunrange=12
set /a cpustunned=1
set /a cpustunnedrounds=0
)


set /a stun=%random%*10/32767+1
if %move3%==4 if %backmove3%==2 if %cpustunned%==0 if %countered3%==0 if %stun%==1 (
set /a ocpustunrange=12
set /a cpustunned=1
set /a cpustunnedrounds=0
)
if %cpustunned%==1 goto GameValidAttack004P3
:GameValidAttack004Wizard
if %wizard%==0 goto GameValidAttack004P2
set /a specialmove1=%random%*7/33767+1
set /a specialmove2=%random%*30/33767+1
if %class%==14 (
set /a specialmove1=%random%*5/33767+1
set /a specialmove2=%random%*16/33767+1
set /a specialmove3=%random%*10/33767+1
if %cpuhealth% LEQ 135 set /a specialmove3=%random%*8/33767+1
if %cpuhealth% LEQ 90 set /a specialmove3=%random%*6/33767+1
if %cpuhealth% LEQ 60 set /a specialmove3=%random%*4/33767+1
)
if %cpuhealth% LEQ 90 set /a specialmove1=%random%*5/33767+1
if %cpuhealth% LEQ 36 set /a specialmove1=%random%*4/33767+1
if %class%==14 if %cpuhealth% LEQ 52 set /a specialmove1=%random%*3/33767+1
if %sameattack% GEQ 2 set /a specialmove2=1
if %sameattack2% GEQ 2 set /a specialmove2=1
if %sameattack3% GEQ 2 set /a specialmove2=1

if %specialmove1%==1 (
set /a cpumove=0
set /a damage=%damage%+12
if %cpuhealth% LEQ 36 set /a damage=%damage%+12
)
if %specialmove2%==1 (
set /a cpumove=0
set /a damage=%damage%+50
)
if %specialmove3%==1 set /a cpuheal=%cpuheal%+%random%*36/33767+5
::This code above ^^ is the code for a mage/wizard, it MUST be placed in this specific location or else mage can stun you while using fireball!
:GameValidAttack004P2
set /a stun=%random%*20/32767+1
if %cpustunned%==0 if %cpumove%==3 if %stunned%==0 if %cpucountered1%==0 if %stun%==1 (
set /a ostunrange=15
set /a stunned=1
set /a stunnedrounds=0
)

set /a stun=%random%*20/32767+1
if %cpustunned%==0 if %cpumove2%==3 if %stunned%==0 if %cpucountered2%==0 if %stun%==1 (
set /a ostunrange=15
set /a stunned=1
set /a stunnedrounds=0
)

set /a stun=%random%*20/32767+1
if %cpustunned%==0 if %cpumove3%==3 if %stunned%==0 if %cpucountered3%==0 if %stun%==1 (
set /a ostunrange=15
set /a stunned=1
set /a stunnedrounds=0
)

set /a stun=%random%*10/32767+1
if %cpustunned%==0 if %cpumove%==4 if %cpubackmove%==2 if %stunned%==0 if %cpucountered1%==0 if %stun%==1 (
set /a ostunrange=12
set /a stunned=1
set /a stunnedrounds=0
)

set /a stun=%random%*10/32767+1
if %cpustunned%==0 if %cpumove2%==4 if %cpubackmove2%==2 if %stunned%==0 if %cpucountered2%==0 if %stun%==1 (
set /a ostunrange=12
set /a stunned=1
set /a stunnedrounds=0
)

set /a stun=%random%*10/32767+1
if %cpustunned%==0 if %cpumove3%==4 if %cpubackmove3%==2 if %stunned%==0 if %cpucountered3%==0 if %stun%==1 (
set /a ostunrange=12
set /a stunned=1
set /a stunnedrounds=0
)
:GameValidAttack004P3
if %stunned%==0 if %cpustunned%==0 goto GameValidAttack005John
set /a stunrange=(%ostunrange%+(%stunnedrounds%*6))+%stunresist%
set /a unstun=%random%*100/33767+1
if %stunned%==1 if %unstun% LEQ %stunrange% set /a stunned=0
set /a cpustunrange=%ocpustunrange%+(%cpustunnedrounds%*6)+%cpustunresist%
set /a cpuunstun=%random%*100/33767+1
if %cpustunned%==1 if %cpuunstun% LEQ %cpustunrange% set /a cpustunned=0 
:: Tries to unstun you ^^
if %stunned%==1 (
set /a move=0
set /a move2=0
set /a move3=0
)
if %cpustunned%==1 (
set /a cpumove=0
set /a cpumove2=0
set /a cpumove3=0
)
:: Stuns you ^^
if %cpustunned%==1 (
set /a specialmove1=0
set /a specialmove2=0
goto GameValidAttack006
)
::Removes abilities during stun ^^
if %ran%==1 goto GameValidAttack006
if %boss%==0 goto GameValidAttack005NotBoss
:GameValidAttack005John
if NOT %boss%==2 goto GameValidAttack005NotBoss
set /a switchopponent=%random%*8/33767+1
if %cpuhealth% LSS 60 set /a switchopponent=%random%*5/33767+1
if %cpuhealth% LSS 30 set /a switchopponent=%random%*3/33767+1
if %defeatedopponent%==1 (
set /a opponent%multifight%=0
set /a switchopponent=1
)

if %opponentsleft%==1 if %cpushadowlevel%==0 goto JohnsBossCutScene

if %switchopponent%==1 if %multifight%==1 if %opponentsleft% GEQ 1 set /a trigger1=1
if %trigger1%==1 (
if %opponent2% GTR 0 set /a multifight=2
if %opponent3% GTR 0 set /a multifight=3
)
if %trigger1%==1 if %opponent2% GTR 0 if %opponent3% GTR 0 set /a multifight=%random%*2/33767+2
if %trigger1%==1 goto GameValidAttack005John2


if %switchopponent%==1 if %multifight%==2 if %opponentsleft% GEQ 1 set /a trigger2=1
if %trigger2%==1 (
if %opponent1% GTR 0 set /a multifight=1
if %opponent3% GTR 0 set /a multifight=3
)
if %trigger2%==1 if %opponent1% GTR 0 if %opponent3% GTR 0 set /a multifight=%random%*2/33767+1
if %trigger2%==1 if %multifight%==2 set /a multifight=3
if %trigger2%==1 goto GameValidAttack005John2

if %switchopponent%==1 if %multifight%==3 if %opponentsleft% GEQ 1 set /a trigger3=1
if %trigger3%==1 (
if %opponent1% GTR 0 set /a multifight=1
if %opponent2% GTR 0 set /a multifight=2
)
if %opponent2% GTR 0 if %opponent3% GTR 0 set /a multifight=%random%*2/33767+1
::This decides what can be switched and if they should switch
if %trigger3%==1 goto GameValidAttack005John2
goto GameValidAttack005NotBoss
:GameValidAttack005John2
if %switchopponent%==1 set /a sayline=%random%*2/33767+1
if %multifight%==1 if %switchopponent%==1 (
set /a cpuhealth=%opponent1%
if %sayline%==1 set /a line=1
if %sayline%==2 set /a line=2
set /a cpudamagelevel=2
set /a cpuspeedlevel=1
set /a encritrange=16
set "classname=John"
goto GameValidAttack005NotBoss
)

if %multifight%==2 if %switchopponent%==1 (
set /a cpuhealth=%opponent2%
if %sayline%==1 set /a line=3
if %sayline%==2 set /a line=4
set /a cpuspeedlevel=3
set /a cpudamagelevel=2
set /a encritrange=14
set "classname=Jonathan"
goto GameValidAttack005NotBoss
)

if %multifight%==3 if %switchopponent%==1 (
set /a cpuhealth=%opponent3%
if %sayline%==1 set /a line=5
if %sayline%==2 set /a line=6
set /a cpuspeedlevel=2
set /a cpudamagelevel=4
set /a encritrange=12
set "classname=Johnny"
goto GameValidAttack005NotBoss
)
::If a switch happens this part of the code will switch the stats up and change the name ^^
:GameValidAttack005NotBoss
:GameValidAttack005Snowman
if NOT %class%==15 goto GameValidAttack005Werewolf
set /a speak=%random%*10/32767+1
if %speak%==1 if %bleeding% GEQ 1 set /a line=1
set /a specialmove1=0
set /a specialmove2=0
set /a specialmove3=0
set /a trigger1=0
set /a trigger2=0

if %gamespeedlevel% GTR 1 if %stunned%==0 set /a specialmove1=%random%*4/32767+1
if %specialmove1%==1 (
if %stunned%==0 set /a ostunrange=30
if %stunned%==0 set /a stunned=1
if %stunned%==0 set /a stunnedrounds=0
)
if %specialmove1%==1 (
set /a damage=%damage%+8
set /a line=2
if %gamespeedlevel% GTR 1 if %slowrounds%==0 set /a gamespeedlevel=%gamespeedlevel%-1
set /a slowrounds=4
)
set /a trigger1=0
set /a trigger2=0

if %bleeding% GEQ 1 set /a specialmove2=%random%*10/32767+1
if %bleeding% GEQ 5 set /a specialmove2=%random%*8/32767+1
if %bleeding% GEQ 10 set /a specialmove2=%random%*6/32767+1
if %specialmove2%==1 (
set /a line=3
set /a damage=%damage%+%bleeding%*4
set /a encrit=1
set /a bleeding=%bleeding%/2
)

set /a specialmove3=%random%*10/32767+1
if %specialmove3%==1 (
set /a line=4
set /a bleeding=%bleeding%+5
set /a damage=%damage%+%bleeding%
)
:GameValidAttack005Werewolf
if NOT %class%==16 goto GameValidAttack005Vampire
set /a specialmove1=%random%*7/33767+1
if %sameattack2% GEQ 3 set /a specialmove1=1
if %sameattack3% GEQ 3 set /a specialmove1=1
if %specialmove1%==1 set /a gamedamagelevel=%gamedamagelevel%-1
if %specialmove1%==1 set /a cpudamagelevel=%cpudamagelevel%+1
:GameValidAttack005Vampire
if NOT %class%==17 goto GameValidAttack005Thief
set /a changeform=%random%*10/33767+1
if %form%==1 if %cpuhealth% LEQ 90 set /a changeform=%random%*8/33767+1
if %form%==1 if %cpuhealth% LEQ 60 set /a changeform=%random%*6/33767+1
if %form%==1 if %cpuhealth% LEQ 40 set /a changeform=%random%*4/33767+1
if %form%==1 if %cpuhealth% LEQ 20 set /a changeform=%random%*2/33767+1

if %form%==2 if %cpuhealth% GEQ 100 set /a changeform=%random%*2/33767+1
if %form%==2 if %cpuhealth% GEQ 80 set /a changeform=%random%*4/33767+1
if %form%==2 if %cpuhealth% GEQ 60 set /a changeform=%random%*6/33767+1
if %form%==2 if %cpuhealth% GEQ 40 set /a changeform=%random%*8/33767+1
if %changeform%==1 if %form%==1 (
set /a form=2
set "classname=Vampire (Bat)"
set /a cpudamagelevel=2
set /a cpuspeedlevel=2
set /a encritrange=24
set /a cpuresist=50
goto GameValidAttack006
)
if %changeform%==1 if %form%==2 (
set /a form=1
set "classname=Vampire (Normal)"
set /a cpudamagelevel=4
set /a cpuspeedlevel=1
set /a encritrange=16
set /a cpuresist=0
goto GameValidAttack006
)
:GameValidAttack005Thief
if NOT %class%==11 goto GameValidAttack006
set /a ran=1
if %form%==2 set /a specialmove1=%random%*12/33767+1
if %form%==2 if %cpuhealth% LEQ 60 set /a specialmove1=%random%*8/33767+1
if %form%==2 if %cpuhealth% LEQ 40 set /a specialmove1=%random%*6/33767+1
if %form%==2 if %cpuhealth% LEQ 20 set /a specialmove1=%random%*4/33767+1
if %specialmove1%==1 if %form%==2 if %stunned%==0 (
set /a damage=%damage%+8
set /a ostunrange=0
set /a stunned=1
set /a stunnedrounds=0
goto GameValidAttack004Stun
)

if %form%==1 if %specialmove1%==1 set /a specialmove2=%random%*3/33767+1
if %form%==1 if %specialmove1%==1 (
if %specialmove2%==1 set /a damage=%damage%+25
)

if %form%==1 if %cpuhealth% LEQ 100 if %cpuitemid%==1 (
set /a cpuwpnitemface=3
set /a cpuwpnitemchest=10
set /a cpuwpnitemsweep=1
set /a cpuwpnitemback=4
set /a cpubleedingweapon=1
set /a cpuitemid=2
set /a line=2
)
if %form%==1 if %cpuhealth% LEQ 70 if %specialmove1%==0 (
set /a specialmove1=1
set /a line=3
)
:GameValidAttack006

set /a cpufacedmg=((50+((50/2)*(%cpudamagelevel%-1)))/10)+%cpuwpnitemface%
set /a cpuchestdmg=4+(2*(%cpudamagelevel%-1))+%cpuwpnitemchest%
set /a cpusweepdmg=((30+((30/2)*(%cpudamagelevel%-1)))/10)+%cpuwpnitemsweep%
set /a cpubackfaildmg=6+(3*(%gamedamagelevel%-1))+%wpnitemchest%
set /a cpubackdmg=10+((10/2)*(%cpudamagelevel%-1))+%cpuwpnitemback%
set /a cpublockfacedmg=10+(5*(%cpudamagelevel%-1))
set /a cpublockchestdmg=8+(4*(%cpudamagelevel%-1))
set /a cpublocksweepdmg=6+(3*(%cpudamagelevel%-1))
set /a cpublockbackdmg=20+(10*(%cpudamagelevel%-1))
set /a cpublockbackfaildmg=12+(6*(%cpudamagelevel%-1))

::Below this is the hit reg
if %cpuspeedlevel% LSS 2 set /a cpumove2=0
if %cpuspeedlevel% LSS 3 set /a cpumove3=0
if %move%==1 if NOT %cpumove%==5 set /a cpudamage=%cpudamage%+%facedmg%
if %move%==2 if NOT %cpumove%==6 set /a cpudamage=%cpudamage%+%chestdmg%
if %move%==3 if NOT %cpumove%==7 set /a cpudamage=%cpudamage%+%sweepdmg%
if %move%==4 if NOT %cpumove%==8 if %backmove%==1 set /a damage=%damage%+%backfaildmg%
if %move%==4 if NOT %cpumove%==8 if %backmove%==2 set /a cpudamage=%cpudamage%+%backdmg%
if %move%==5 if %cpumove%==1 set /a cpudamage=%cpudamage%+%blockfacedmg%
if %move%==6 if %cpumove%==2 set /a cpudamage=%cpudamage%+%blockchestdmg%
if %move%==7 if %cpumove%==3 set /a cpudamage=%cpudamage%+%blocksweepdmg%
if %move%==8 if %cpumove%==4 if %cpubackmove%==2 set /a cpudamage=%cpudamage%+%blockbackdmg%
if %move%==8 if %cpumove%==4 if %cpubackmove%==1 set /a cpudamage=%cpudamage%+%blockbackfaildmg%

if %cpumove%==1 if NOT %move%==5 set /a damage=%damage%+%cpufacedmg%
if %cpumove%==2 if NOT %move%==6 set /a damage=%damage%+%cpuchestdmg%
if %cpumove%==3 if NOT %move%==7 set /a damage=%damage%+%cpusweepdmg%
if %cpumove%==4 if %cpubackmove%==1 set /a cpudamage=%cpudamage%+%cpubackfaildmg%
if %cpumove%==4 if NOT %move%==8 if %cpubackmove%==2 set /a damage=%damage%+%cpublockfacedmg%
if %cpumove%==5 if %move%==1 set /a damage=%damage%+%cpublockfacedmg%
if %cpumove%==6 if %move%==2 set /a damage=%damage%+%cpublockchestdmg%
if %cpumove%==7 if %move%==3 set /a damage=%damage%+%cpublocksweepdmg%
if %cpumove%==8 if %move%==4 if %backmove%==2 set /a damage=%damage%+%cpublockbackdmg%
if %cpumove%==8 if %move%==4 if %backmove%==1 set /a damage=%damage%+%cpublockbackfaildmg%

if %move2%==0 if %cpumove2% GTR 0 goto GameValidAttack007
if %move2%==0 if %cpumove2%==0 goto GameValidAttack009
if %move2%==1 if NOT %cpumove2%==5 set /a cpudamage=%cpudamage%+%facedmg%
if %move2%==2 if NOT %cpumove2%==6 set /a cpudamage=%cpudamage%+%chestdmg%
if %move2%==3 if NOT %cpumove2%==7 set /a cpudamage=%cpudamage%+%sweepdmg%
if %move2%==4 if NOT %cpumove2%==8 if %backmove2%==1 set /a damage=%damage%+%backfaildmg%
if %move2%==4 if NOT %cpumove2%==8 if %backmove2%==2 set /a cpudamage=%cpudamage%+%backdmg%
if %move2%==5 if %cpumove2%==1 set /a cpudamage=%cpudamage%+%blockfacedmg%
if %move2%==6 if %cpumove2%==2 set /a cpudamage=%cpudamage%+%blockchestdmg%
if %move2%==7 if %cpumove2%==3 set /a cpudamage=%cpudamage%+%blocksweepdmg%
if %move2%==8 if %cpumove2%==4 if %cpubackmove2%==2 set /a cpudamage=%cpudamage%+%blockbackdmg%
if %move2%==8 if %cpumove2%==4 if %cpubackmove2%==1 set /a cpudamage=%cpudamage%+%blockbackfaildmg%

:GameValidAttack007
if %cpumove2%==1 if NOT %move2%==5 set /a damage=%damage%+%cpufacedmg%
if %cpumove2%==2 if NOT %move2%==6 set /a damage=%damage%+%cpuchestdmg%
if %cpumove2%==3 if NOT %move2%==7 set /a damage=%damage%+%cpusweepdmg%
if %cpumove2%==4 if %cpubackmove2%==1 set /a cpudamage=%cpudamage%+%cpubackfaildmg%
if %cpumove2%==4 if NOT %move2%==8 if %cpubackmove2%==2 set /a damage=%damage%+%cpublockfacedmg%
if %cpumove2%==5 if %move2%==1 set /a damage=%damage%+%cpublockfacedmg%
if %cpumove2%==6 if %move2%==2 set /a damage=%damage%+%cpublockchestdmg%
if %cpumove2%==7 if %move2%==3 set /a damage=%damage%+%cpublocksweepdmg%
if %cpumove2%==8 if %move2%==4 if %backmove2%==2 set /a damage=%damage%+%cpublockbackdmg%
if %cpumove2%==8 if %move2%==4 if %backmove2%==1 set /a damage=%damage%+%cpublockbackfaildmg%



if %move3%==0 if %cpumove3% GTR 0 goto GameValidAttack008
if %move3%==0 if %cpumove3%==0 goto GameValidAttack009

if %move3%==1 if NOT %cpumove3%==5 set /a cpudamage=%cpudamage%+%facedmg%
if %move3%==2 if NOT %cpumove3%==6 set /a cpudamage=%cpudamage%+%chestdmg%
if %move3%==3 if NOT %cpumove3%==7 set /a cpudamage=%cpudamage%+%sweepdmg%
if %move3%==4 if NOT %cpumove3%==8 if %backmove3%==1 set /a damage=%damage%+%backfaildmg%
if %move3%==4 if NOT %cpumove3%==8 if %backmove3%==2 set /a cpudamage=%cpudamage%+%backdmg%
if %move3%==5 if %cpumove3%==1 set /a cpudamage=%cpudamage%+%blockfacedmg%
if %move3%==6 if %cpumove3%==2 set /a cpudamage=%cpudamage%+%blockchestdmg%
if %move3%==7 if %cpumove3%==3 set /a cpudamage=%cpudamage%+%blocksweepdmg%
if %move3%==8 if %cpumove3%==4 if %cpubackmove3%==2 set /a cpudamage=%cpudamage%+%blockbackdmg%
if %move3%==8 if %cpumove3%==4 if %cpubackmove3%==1 set /a cpudamage=%cpudamage%+%blockbackfaildmg%


:GameValidAttack008
if %cpumove3%==1 if NOT %move3%==5 set /a damage=%damage%+%cpufacedmg%
if %cpumove3%==2 if NOT %move3%==6 set /a damage=%damage%+%cpuchestdmg%
if %cpumove3%==3 if NOT %move3%==7 set /a damage=%damage%+%cpusweepdmg%
if %cpumove3%==4 if %cpubackmove3%==1 set /a cpudamage=%cpudamage%+%cpubackfaildmg%
if %cpumove3%==4 if NOT %move3%==8 if %cpubackmove3%==2 set /a damage=%damage%+%cpublockfacedmg%
if %cpumove3%==5 if %move3%==1 set /a damage=%damage%+%cpublockfacedmg%
if %cpumove3%==6 if %move3%==2 set /a damage=%damage%+%cpublockchestdmg%
if %cpumove3%==7 if %move3%==3 set /a damage=%damage%+%cpublocksweepdmg%
if %cpumove3%==8 if %move3%==4 if %backmove3%==2 set /a damage=%damage%+%cpublockbackdmg%
if %cpumove3%==8 if %move3%==4 if %backmove3%==1 set /a damage=%damage%+%cpublockbackfaildmg%
:GameValidAttack009
if %bleeding%==0 if %cpubleeding%==0 goto GameValidAttack010
if %cpubleeding% GTR 0 set /a cpubleedingdamage=%cpubleedingdamage%+%cpubleeding%
if %bleeding% GTR 0 set /a bleedingdamage=%bleedingdamage%+%bleeding%
::Makes you bleed ^^
set /a slowbleeding=%random%*3/32767+1
if %cpubleeding% GTR 0 if %slowbleeding%==1 set /a cpubleeding=%cpubleeding%-1
set /a slowbleeding=%random%*3/32767+1
if %bleeding% GTR 0 if %slowbleeding%==1 set /a bleeding=%bleeding%-1
::Try's to stop you from bleeding ^^
:GameValidAttack010
if %stunned%==1 goto GameValidAttack010E
if %bleedingweapon%==0 goto GameValidAttack010E
set /a bleed=%random%*2/32767+1
if %move% LEQ 4 if %countered1%==0 if %bleed%==1 set /a cpubleeding=%cpubleeding%+1
set /a bleed=%random%*2/32767+1
if %move% GTR 4 if %cpucountered1%==1 if %bleed%==1 set /a cpubleeding=%cpubleeding%+1
if %gamespeedlevel% LSS 2 goto GameValidAttack010E
set /a bleed=%random%*2/32767+1
if %move2% LEQ 4 if %countered2%==0 if %bleed%==1 set /a cpubleeding=%cpubleeding%+1
set /a bleed=%random%*2/32767+1
if %move2% GTR 4 if %cpucountered1%==1 if %bleed%==1 set /a cpubleeding=%cpubleeding%+1
if %gamespeedlevel% LSS 3 goto GameValidAttack010E
set /a bleed=%random%*2/32767+1
if %move3% LEQ 4 if %countered3%==0 if %bleed%==1 set /a cpubleeding=%cpubleeding%+1
set /a bleed=%random%*2/32767+1
if %move3% GTR 4 if %cpucountered1%==1 if %bleed%==1 set /a cpubleeding=%cpubleeding%+1
::Causes bleeding  ^^
:GameValidAttack010E
if %cpustunned%==1 goto GameValidAttack011
if %cpubleedingweapon%==0 goto GameValidAttack011

set /a bleed=%random%*2/32767+1
if %cpumove% LEQ 4 if %cpucountered1%==0 if %bleed%==1 set /a bleeding=%bleeding%+1
set /a bleed=%random%*2/32767+1
if %cpumove% GTR 4 if %countered1%==1 if %bleed%==1 set /a bleeding=%bleeding%+1
if %cpuspeedlevel% LSS 2 goto GameValidAttack011
set /a bleed=%random%*2/32767+1
if %cpumove2% LEQ 4 if %cpucountered2%==0 if %bleed%==1 set /a bleeding=%bleeding%+1
set /a bleed=%random%*2/32767+1
if %cpumove2% GTR 4 if %countered1%==1 if %bleed%==1 set /a bleeding=%bleeding%+1
if %cpuspeedlevel% LSS 3 goto GameValidAttack011
set /a bleed=%random%*2/32767+1
if %cpumove3% LEQ 4 if %cpucountered3%==0 if %bleed%==1 set /a bleeding=%bleeding%+1
set /a bleed=%random%*2/32767+1
if %cpumove3% GTR 4 if %countered1%==1 if %bleed%==1 set /a bleeding=%bleeding%+1

::Starts bleeding ^^
:GameValidAttack011
if %itembreakable%==0 goto GameValidAttack012
if %itembreakable%==1 set /a break=%random%*100/33767+1
if %break% LEQ %itembreakchance% (
set /a wpnitemface=0
set /a wpnitemchest=0
set /a wpnitemsweep=0
set /a wpnitemback=0
set /a bleedingweapon=0
set /a itembreakable=0
set /a itembreakchance=0
set /a itemid=0
set /a itembroke=1
)
:GameValidAttack012
if NOT %crit%==1 if %cpudamage% GTR 0 if %stunned%==0 set /a crit=%random%*%critrange%/33767+1
if NOT %encrit%==1 if %cpucc%==1 if %cpustunned%==0 if %damage% GTR 0 set /a encrit=%random%*%encritrange%/33767+1
if %crit%==1 (
set /a givexp=%givexp%+1
set /a cpudamage=%cpudamage%*2
)
if %level% LSS 20 if %crit%==1 set /a givexp=%givexp%+2
if %encrit%==1 set /a damage=%damage%*2
if %class%==17 (
if %form%==1 set /a cpuheal=%damage%/2
if %form%==2 set /a cpuheal=%damage%
)

set /a cpudamamge=0
if %cpucbleed%==0 set /a cpubleeding=0
set /a resisted=(%damage%*%resist%)
set /a cpuresisted=(%cpudamage%*%cpuresist%)
set /a damage=%damage%+%bleedingdamage%
set /a cpudamage=%cpudamage%+%cpubleedingdamage%
set /a damage=((%damage%*100)-(%resisted%))/100
set /a cpudamage=((%cpudamage%*100)-(%cpuresisted%))/100

if %dummy%==1 (
set /a cpumove=0
set /a cpumove2=0
set /a cpumove3=0
set /a damage=0
set /a stunned=0
)

if %cpudamage% GTR 40 if NOT %level%==%maxlevel% set /a givexp=%givexp%+(%damage%/16)
set /a health=%health%+%heal%
set /a cpuhealth=%cpuhealth%+%cpuheal%
set /a health=%health%-%damage%
set /a cpuhealth=%cpuhealth%-%cpudamage%

set /a vdamage=%damage%-%heal%
set /a vheal=0
if %vdamage% LSS 0 (
set /a vheal=-%vdamage%
set /a vdamage=0
)
set /a vcpudamage=%cpudamage%-%cpuheal%
set /a vcpuheal=0
if %vcpudamage% LSS 0 (
set /a vcpuheal=-%vcpudamage%
set /a vcpudamage=0
)
::This here ^^ decides if it says your taking damage or being healed more (1.3.0 [ALPHA])

if %cangoabovemaxhp%==0 if %health% GTR %maxhealth% set /a health=%maxhealth%
if %cpucangoabovemaxhp%==0 if %cpuhealth% GTR %cpumaxhealth% set /a cpuhealth=%cpumaxhealth%
set /a opponent%multifight%=%cpuhealth%
if %stunned%==1 set /a stunnedrounds=%stunnedrounds%+1
if %cpustunned%==1 set /a cpustunnedrounds=%cpustunnedrounds%+1
if %mute%==1 goto Game
if %boss%==1 (
if %move%==1 if NOT %cpumove%==5 goto MaraxPunchSound
if %move%==2 if NOT %cpumove%==6 goto MaraxPunchSound
if %move%==3 if NOT %cpumove%==7 goto MaraxSweepSound
if %move%==4 if NOT %cpumove%==8 if %backmove%==2 goto MaraxBackSound
if %move%==5 if %cpumove%==1 goto MaraxCounteredSound
if %move%==6 if %cpumove%==2 goto MaraxCounteredSound
if %move%==7 if %cpumove%==3 goto MaraxCounteredSound
if %move%==8 if %cpumove%==4 goto MaraxCounteredSound
if %cpumove%==1 if NOT %move%==5 goto CPUMaraxPunchSound
if %cpumove%==2 if NOT %move%==6 goto CPUMaraxPunchSound
if %cpumove%==3 if NOT %move%==7 goto CPUMaraxSweepSound
if %cpumove%==4 if NOT %move%==8 if %cpubackmove%==2 goto CPUMaraxBackSound
if %cpumove%==5 if %move%==1 goto MaraxCounteredSound
if %cpumove%==6 if %move%==2 goto MaraxCounteredSound
if %cpumove%==7 if %move%==3 goto MaraxCounteredSound
if %cpumove%==8 if %move%==4 goto MaraxCounteredSound
)
if %move%==1 if NOT %cpumove%==5 goto GamePunchSound
if %move%==2 if NOT %cpumove%==6 goto GamePunchSound
if %move%==3 if NOT %cpumove%==7 goto GameSweepSound
if %move%==4 if NOT %cpumove%==8 if %backmove%==2 goto GameBackSound
if %move%==5 if %cpumove%==1 goto GameCounteredSound
if %move%==6 if %cpumove%==2 goto GameCounteredSound
if %move%==7 if %cpumove%==3 goto GameCounteredSound
if %move%==8 if %cpumove%==4 goto GameCounteredSound
if %cpumove%==1 if NOT %move%==5 goto CPUGamePunchSound
if %cpumove%==2 if NOT %move%==6 goto CPUGamePunchSound
if %cpumove%==3 if NOT %move%==7 goto CPUGameSweepSound
if %cpumove%==4 if NOT %move%==8 if %cpubackmove%==2 goto CPUGameBackSound
if %cpumove%==5 if %move%==1 goto GameCounteredSound
if %cpumove%==6 if %move%==2 goto GameCounteredSound
if %cpumove%==7 if %move%==3 goto GameCounteredSound
if %cpumove%==8 if %move%==4 goto GameCounteredSound
cls
goto Game

:GamePunchSound
set /a punchsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\punch%punchsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %cpumove%==1 goto CPUGamePunchSound
if %cpumove%==2 goto CPUGamePunchSound
if %cpumove%==3 goto CPUGameSweepSound
if %cpumove%==4 goto CPUGameBackSound
if %class%==16 if %specialmove1%==1 goto WolfHowlSound
if %class%==13 if %specialmove2%==10 goto HitmanShootSound
if %class%==11 if %form%==1 if %specialmove1%==1 goto GunShotSound
cls
goto Game

:CPUGamePunchSound
set /a punchsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\punch%punchsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
if %mute%==0 start /min sound2.vbs
if %class%==16 if %specialmove1%==1 goto WolfHowlSound
if %class%==13 if %specialmove2%==10 goto HitmanShootSound
if %class%==11 if %form%==1 if %specialmove1%==1 goto GunShotSound
cls
goto Game

:GameSweepSound
set /a sweepsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\sweep%sweepsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %cpumove%==1 goto CPUGamePunchSound
if %cpumove%==2 goto CPUGamePunchSound
if %cpumove%==3 goto CPUGameSweepSound
if %cpumove%==4 goto CPUGameBackSound
if %class%==16 if %specialmove1%==1 goto WolfHowlSound
if %class%==13 if %specialmove2%==10 goto HitmanShootSound
if %class%==11 if %form%==1 if %specialmove1%==1 goto GunShotSound
cls
goto Game

:CPUGameSweepSound
set /a sweepsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\sweep%sweepsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
if %mute%==0 start /min sound2.vbs
if %class%==16 if %specialmove1%==1 goto WolfHowlSound
if %class%==13 if %specialmove2%==10 goto HitmanShootSound
if %class%==11 if %form%==1 if %specialmove1%==1 goto GunShotSound
cls
goto Game

:GameBackSound
if %mute%==0 set "file=sounds\backattack.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %cpumove%==1 goto CPUGamePunchSound
if %cpumove%==2 goto CPUGamePunchSound
if %cpumove%==3 goto CPUGameSweepSound
if %cpumove%==4 goto CPUGameBackSound
if %class%==16 if %specialmove1%==1 goto WolfHowlSound
if %class%==13 if %specialmove2%==10 goto HitmanShootSound
if %class%==11 if %form%==1 if %specialmove1%==1 goto GunShotSound
cls
goto Game

:CPUGameBackSound
if %mute%==0 set "file=sounds\backattack.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
if %mute%==0 start /min sound2.vbs
if %class%==16 if %specialmove1%==1 goto WolfHowlSound
if %class%==13 if %specialmove2%==10 goto HitmanShootSound
if %class%==11 if %form%==1 if %specialmove1%==1 goto GunShotSound
cls
goto Game

:GameCounteredSound
if %mute%==0 set "file=sounds\bone1.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %class%==16 if %specialmove1%==1 goto WolfHowlSound
if %class%==13 if %specialmove2%==10 goto HitmanShootSound
if %class%==11 if %form%==1 if %specialmove1%==1 goto GunShotSound
cls
goto Game

:MaraxPunchSound
set /a punchsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\punch%punchsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %cpumove%==1 goto CPUMaraxPunchSound
if %cpumove%==2 goto CPUMaraxPunchSound
if %cpumove%==3 goto CPUMaraxPunchSound
if %cpumove%==4 goto CPUMaraxPunchSound
if %specialmove1%==1 goto CPUMaraxBreathlessSound
cls
goto Game

:CPUMaraxPunchSound
set /a punchsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\marax%punchsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
if %mute%==0 start /min sound2.vbs
cls
goto Game

:MaraxSweepSound
set /a sweepsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\sweep%sweepsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %cpumove%==1 goto CPUMaraxPunchSound
if %cpumove%==2 goto CPUMaraxPunchSound
if %cpumove%==3 goto CPUMaraxPunchSound
if %cpumove%==4 goto CPUMaraxPunchSound
if %specialmove1%==1 goto CPUMaraxBreathlessSound
cls
goto Game

:CPUMaraxSweepSound
set /a punchsound=%random%*2/32767+1
if %mute%==0 set "file=sounds\marax%punchsound%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound2.vbs
cls
goto Game

:MaraxBackSound
if %mute%==0 set "file=sounds\backattack.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %cpumove%==1 goto CPUMaraxPunchSound
if %cpumove%==2 goto CPUMaraxPunchSound
if %cpumove%==3 goto CPUMaraxPunchSound
if %cpumove%==4 goto CPUMaraxPunchSound
if %specialmove1%==1 goto CPUMaraxBreathlessSound
cls
goto Game

:MaraxCounteredSound
set "file=sounds\bone1.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cls
goto Game

:CPUMaraxBreathlessSound
set "file=sounds\breathless.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
start /min sound2.vbs
cls
goto Game

:PlayMaraxMusic
cls
if %mute%==0 set "file=sounds\maraxmusic.m4a"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >music.vbs
if %mute%==0 start /min music.vbs
goto Game

:HitmanShootSound
if %class%==13 if %statson%==1 if %mute%==0 set "file=sounds\hitmanshoot.m4a"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
if %mute%==0 start /min sound2.vbs
cls
goto Game

:GunShotSound
if %mute%==0 set "file=sounds\gunshot.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
if %mute%==0 start /min sound2.vbs
cls
goto Game

:WolfHowlSound
if %mute%==0 set "file=sounds\wolf.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
if %mute%==0 start /min sound2.vbs
cls
goto Game

:GameItems
set /a icr=3
set /a icr2=1
set /a itemmenu=0
set /a refreshed=1
if %hasitems%==0 goto NoItems 
color a
cls
echo What item category would you like to use?
if %hasitems% LSS 3 echo You can also buy more items by saying "Shop"!
if %haswpnitems% GEQ 1 echo Say "Weapon" to see all your Weapons
if %damageitem%==0 if %hasdmgitems% GEQ 1 echo Say "Damage" to see all your damage items
if %healthitem%==0 if %hashealthitems% GEQ 1 echo Say "Health" to see all your damage items
if %hasxpitems% GEQ 1 echo Say "XP" to see all your xp items
if %hasotheritems% GEQ 1 echo Say "Other" to see all your other items
echo Say "Exit" to return back to the game
set /p item=
goto UseItemCheck
:GameItems2
echo That wasn't an option, try again.
pause >nul
goto GameItems

:UseItemCheck
if %itemmenu%==6 set "item=%move%"
if /i "%item%"=="Shop" goto Shop
if %haswpnitems% GEQ 1 if /i "%item%"=="Weapon" goto WeaponItems
:UseItemCheckWPN
if %wpnitemstick% GTR 0 if /i "%item%"=="Stick" goto UseWPNItemStick
if %wpnitemcleats% GTR 0 if /i "%item%"=="Cleats" goto UseWPNItemCleats
if %wpnitembat% GTR 0 if /i "%item%"=="Bat" goto UseWPNItemBat
if %wpnitemknife% GTR 0 if /i "%item%"=="Knife" goto UseWPNItemKnife
:UseItemCheckXP
if %xpitem%==2 goto UseItemCheckDMG
if %hasxpitems% GEQ 1 if /i "%item%"=="XP" goto XPItems
if %xpitemhandwraps% GTR 0 if /i "%item%"=="Hand Wraps" goto UseXPItemHandWraps
if %xpitemhandwraps% GTR 0 if /i "%item%"=="Wraps" goto UseXPItemHandWraps
if %xpitem%==1 goto UseItemCheckDMG
if %xpitemchmpnb% GTR 0 if /i "%item%"=="Champion's Notebook" goto UseXPItemCHMPNB
if %xpitemchmpnb% GTR 0 if /i "%item%"=="Champion" goto UseXPItemCHMPNB
if %xpitemchmpnb% GTR 0 if /i "%item%"=="Notebook" goto UseXPItemCHMPNB
if %xpitemchmpnb% GTR 0 if /i "%item%"=="Champ" goto UseXPItemCHMPNB
if %xpitemchmpnb% GTR 0 if /i "%item%"=="NB" goto UseXPItemCHMPNB
if %xpitemchmpnb% GTR 0 if /i "%item%"=="CNB" goto UseXPItemCHMPNB
:UseItemCheckDMG
if %damageitem%==1 goto UseItemCheckHealth
if %hasdmgitems% GEQ 1 if /i "%item%"=="Damage" goto DamageItems
if %dmgitemgrenade% GTR 0 if /i "%item%"=="Grenade" goto UseDMGItemGrenade
if %dmgitemgrim% GTR 0 if /i "%item%"=="Grim" goto UseDMGItemGrim
if %dmgitemtaser% GTR 0 if /i "%item%"=="Taser" goto UseDMGItemTaser
if %dmgitembottle% GTR 0 if /i "%item%"=="Bottle" goto UseDMGItemBottle
if %dmgitemice% GTR 0 if /i "%item%"=="Ice" goto UseDMGItemIce
:UseItemCheckHealth
if %healthitem%==1 goto UseItemCheckOther
if %healthitem%==0 if %hashealthitems% GEQ 1 if /i "%item%"=="Health" goto HealthItems
if %healthitemmh% GTR 0 if /i "%item%"=="Minor Heal" goto UseHealthItemMinorHeal
if %healthitemmh% GTR 0 if /i "%item%"=="Minor" goto UseHealthItemMinorHeal
if %healthitemah% GTR 0 if /i "%item%"=="Average Heal" goto UseHealthItemAverageHeal
if %healthitemah% GTR 0 if /i "%item%"=="Average" goto UseHealthItemAverageHeal
if %healthitembandage% GTR 0 if /i "%item%"=="Bandage" goto UseHealthItemBandage
if %healthitemmajorheal% GTR 0 if /i "%item%"=="Major Heal" goto UseHealthItemMajorHeal
if %healthitemmajorheal% GTR 0 if /i "%item%"=="Major" goto UseHealthItemMajorHeal
if %healthitemrandomheal% GTR 0 if /i "%item%"=="Random Heal" goto UseHealthItemRandomHeal
if %healthitemrandomheal% GTR 0 if /i "%item%"=="Random" goto UseHealthItemRandomHeal
:UseItemCheckOther
if %hasotheritems% GEQ 1 if /i "%item%"=="Other" goto OtherItems
if %otheritemshatter% GTR 0 if /i "%item%"=="Shatter" goto UseOtherItemShatter
:UseItemCheck2
if /i "%item%"=="Exit" goto ItemCheck
if %itemmenu%==0 goto GameItems2
if %itemmenu%==1 goto DamageItems2
if %itemmenu%==2 goto WeaponItems2
if %itemmenu%==3 goto HealthItems2
if %itemmenu%==4 goto XPItems2
if %itemmenu%==5 goto OtherItems2
if %itemmenu%==6 goto GameItemResume
goto Error1A

:NoItems
cls
if %money% LEQ 0 (
echo You don't have any items to use
pause
goto Game
)
echo You don't have any items to use, would you like to buy some?
set /p input=
if /i "%input%"=="Yes" goto Shop
if /i "%input%"=="No" goto Game
echo Sorry that wasn't an option, try saying "Yes" or "No"!
pause
goto NoItems

:DamageItems
set /a item=0
set /a itemmenu=1
cls
echo Your Items:
if %dmgitemgrenade% GTR 0 echo "Grenade" (x%dmgitemgrenade%)
if %dmgitemtaser% GTR 0 echo "Taser" (x%dmgitemtaser%)
if %dmgitembottle% GTR 0 echo "Bottle" (x%dmgitembottle%) 
if %dmgitemgrim% GTR 0 echo "Grim" (x%dmgitemgrim%)
if %dmgitemice% GTR 0 echo "Ice" (x%dmgitemice%) 
echo Say "Exit" to return back to the items menu
set /p item=
goto UseItemCheck
:DamageItems2
echo You don't have that item, try again.
pause >nul
goto DamageItems

:UseDMGItemGrenade
set /a dmgitemgrenade=%dmgitemgrenade%-1
if %statson%==1 echo %dmgitemgrenade% > "%cd%\data\inv\grd.data"
set /a dmgitem=%random%*9/32767+16
set /a damage=0
set /a cpudamage=%dmgitem%
set /a cpuhealth=%cpuhealth%-%cpudamage%
set /a damageitem=1
if %money% LEQ 30 set /a dropmoney=%random%*3/32767+1
if %money% LEQ 20 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*4/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
if %mute%==1 goto ItemCheck
set "file=sounds\grenade.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
goto ItemCheck

:UseDMGItemGrim
set /a dmgitemgrim=%dmgitemgrim%-1
if %statson%==1 echo %dmgitemgrim% > "%cd%\data\inv\grm.data"
set /a dmgitem=((250+((250/2)*(%damagelevel%-1)))/10)
set /a damage=0
set /a cpudamage=%dmgitem%
set /a cpuhealth=%cpuhealth%-%cpudamage%
set /a damageitem=1
set /a heal=%dmgitem%/2
set /a health=%health%+%heal%
if %health% GTR %maxhealth% set /a health=%maxhealth%
if %money% LEQ 30 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseDMGItemTaser
set /a dmgitemtaser=%dmgitemtaser%-1
if %statson%==1 echo %dmgitemtaser% > "%cd%\data\inv\tsr.data"
set /a damage=0
set /a cpudamage=8
set /a cpuhealth=%cpuhealth%-%cpudamage%
set /a damageitem=1
set /a ocpustunrange=0
set /a cpustunned=1
set /a cpustunnedrounds=0
if %money% LEQ 30 set /a dropmoney=%random%*3/32767+1
if %money% LEQ 20 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*4/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseDMGItemBottle 
set /a dmgitembottle=%dmgitembottle%-1 
if %statson%==1 echo %dmgitembottle% > "%cd%\data\inv\btl.data" 
set /a dmgitem=4 
if %itemid%==0 (
set /a wpnitemface=1
set /a wpnitemchest=1
set /a wpnitemsweep=0
set /a wpnitemback=0
set /a bleedingweapon=1
set /a itemid=4
set /a itembreakable=1
set /a itembreakchance=33
)
set /a cpubleeding=%cpubleeding%+4
set /a damage=0 
set /a cpudamage=%dmgitem% 
set /a cpuhealth=%cpuhealth%-%cpudamage% 
set /a damageitem=1 
if %mute%==1 goto ItemCheck
set "file=sounds\bottle.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
goto ItemCheck 

:UseDMGItemIce 
set /a dmgitemice=%dmgitemice%-1 
if %statson%==1 echo %dmgitemice% > "%cd%\data\inv\ic.data" 
set /a dmgitem=4 
set /a damage=0 
if %cpuspeedlevel%==1 (
set /a ocpustunrange=5
set /a cpustunned=1
set /a cpustunnedrounds=0
)
if %cpuspeedlevel% GTR 1 (
set /a cpuspeedlevel=%cpuspeedlevel%-1
set /a cpuslowrounds=6
)
set /a cpudamage=%dmgitem% 
set /a cpuhealth=%cpuhealth%-%cpudamage% 
set /a damageitem=1 
if %mute%==1 goto ItemCheck
set "file=sounds\ice.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
goto ItemCheck 

:WeaponItems
set /a item=0
set /a itemmenu=2
if %itemid% GTR 0 color c
if %xpitemid% GTR 0 color c
cls
if %xpitemid% GTR 0 echo WARNING: USING AN ITEM WILL RESULT IN LOSING YOUR LAST ONE
if %itemid% GTR 0 echo WARNING: USING AN ITEM WILL RESULT IN LOSING YOUR LAST ONE
echo Your Items:
if %wpnitemstick% GTR 0 echo "Stick" (x%wpnitemstick%)
if %wpnitemcleats% GTR 0 echo "Cleats" (x%wpnitemcleats%)
if %wpnitemknife% GTR 0 echo "Knife" (x%wpnitemknife%)
if %wpnitembat% GTR 0 echo "Bat" (x%wpnitembat%)
echo Say "Exit" to return back to the items menu
set /p item=
goto UseItemCheck
:WeaponItems2
color a
echo You don't have that item, try again.
pause >nul
goto WeaponItems

:UseWPNItemStick
set /a wpnitemstick=%wpnitemstick%-1
if %statson%==1 echo %wpnitemstick% > "%cd%\data\inv\stk.data"
set /a wpnitemface=1
set /a wpnitemchest=1
set /a wpnitemsweep=1
set /a wpnitemback=1
set /a itemid=1
set /a dropmoney=%random%*50/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseWPNItemCleats
set /a wpnitemcleats=%wpnitemcleats%-1
if %statson%==1 echo %wpnitemcleats% > "%cd%\data\inv\clts.data"
set /a wpnitemface=2
set /a wpnitemchest=2
set /a wpnitemsweep=3
set /a wpnitemback=0
set /a itemid=2
if %money% LEQ 20 set /a dropmoney=%random%*2/32767+1
if %money% GTR 20 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseWPNItemKnife 
set /a wpnitemknife=%wpnitemknife%-1 
if %statson%==1 echo %wpnitemknife% > "%cd%\data\inv\knf.data" 
set /a wpnitemface=3 
set /a wpnitemchest=3
set /a wpnitemsweep=2
set /a wpnitemback=4
set /a bleedingweapon=1
set /a itemid=3 
if %money% LEQ 30 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseWPNItemBat
set /a wpnitembat=%wpnitembat%-1
if %statson%==1 echo %wpnitembat% > "%cd%\data\inv\wbt.data"
set /a wpnitemface=3
set /a wpnitemchest=3
set /a wpnitemback=2
set /a itemid=5
if %money% LEQ 20 set /a dropmoney=%random%*2/32767+1
if %money% GTR 20 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:HealthItems
set /a item=0
set /a itemmenu=3
cls
echo Your Items:
if %healthitemmh% GTR 0 echo "Minor Heal" (x%healthitemmh%)
if %healthitembandage% GTR 0 echo "Bandage" (x%healthitembandage%)
if %healthitemah% GTR 0 echo "Average Heal" (x%healthitemah%)
if %healthitemmajorheal% GTR 0 echo "Major Heal" (x%healthitemmajorheal%)
if %healthitemrandomheal% GTR 0 echo "Random Heal" (x%healthitemrandomheal%)
echo Say "Exit" to return back to the items menu
set /p item=
goto UseItemCheck
:HealthItems2
echo That wasn't an option, try again.
pause >nul
goto HealthItems

:UseHealthItemMinorHeal
set /a healthitem=1
set /a healthitemmh=%healthitemmh%-1
if %statson%==1 echo %healthitemmh% > "%cd%\data\inv\mnhl.data"
set /a heal=%random%*7/32767+10
set /a heal=(%maxhealth%*%heal%)/100
set /a health=%health%+%heal%
if %health% GTR %maxhealth% set /a health=%maxhealth%
if %money% LEQ 30 set /a dropmoney=%random%*3/32767+1
if %money% LEQ 20 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*4/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseHealthItemAverageHeal
set /a healthitem=1
set /a healthitemah=%healthitemah%-1
if %statson%==1 echo %healthitemah% > "%cd%\data\inv\avhl.data"
set /a heal=%random%*11/32767+20
set /a heal=(%maxhealth%*%heal%)/100
set /a health=%health%+%heal%
if %health% GTR %maxhealth% set /a health=%maxhealth%
if %money% LEQ 34 set /a dropmoney=%random%*3/32767+1
if %money% LEQ 24 set /a dropmoney=%random%*2/32767+1
if %money% GTR 34 set /a dropmoney=%random%*4/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseHealthItemMajorHeal
set /a healthitem=1
set /a healthitemmajorheal=%healthitemmajorheal%-1
if %statson%==1 echo %healthitemmajorheal% > "%cd%\data\inv\mjhl.data"
set /a heal=%random%*23/32767+30
set /a heal=(%maxhealth%*%heal%)/100
set /a health=%health%+%heal%
if %health% GTR %maxhealth% set /a health=%maxhealth%
if %money% LEQ 30 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseHealthItemRandomHeal
set /a healthitem=1
set /a healthitemrandomheal=%healthitemrandomheal%-1
if %statson%==1 echo %healthitemrandomheal% > "%cd%\data\inv\rndmhl.data"
set /a heal=%random%*53/32767+8
set /a heal=(%maxhealth%*%heal%)/100
set /a health=%health%+%heal%
if %health% GTR %maxhealth% set /a health=%maxhealth%
if %money% LEQ 30 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseHealthItemBandage 
set /a healthitembandage=%healthitembandage%-1 
if %statson%==1 echo %healthitembandage% > "%cd%\data\inv\bdg.data" 
set /a heal=%random%*5/32767+14
set /a bleeding=0
set /a heal=(%maxhealth%*%heal%)/100 
set /a health=%health%+%heal%
if %health% GTR %maxhealth% set /a health=%maxhealth%
if %money% LEQ 30 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:XPItems
if %itemid% GTR 0 color c
if %xpitemid% GTR 0 color c
set /a item=0
set /a itemmenu=4
cls
if %xpitemid% GTR 0 echo WARNING: USING AN ITEM WILL RESULT IN LOSING YOUR LAST ONE
if %itemid% GTR 0 echo WARNING: USING AN ITEM WILL RESULT IN LOSING YOUR LAST ONE
echo Your Items:
if %xpitemhandwraps% GTR 0 echo "Hand Wraps" (x%xpitemhandwraps%)
if %xpitem%==0 if %xpitemchmpnb% GTR 0 echo "Champion's Notebook" (x%xpitemchmpnb%)
echo Say "Exit" to return back to the items menu
set /p item=
goto UseItemCheck
color a
:XPItems2
echo That wasn't an option, try again.
pause >nul
goto XPItems

:UseXPItemHandWraps
set /a xpitemhandwraps=%xpitemhandwraps%-1
if %statson%==1 echo %xpitemhandwraps% > "%cd%\data\inv\xhw.data"
set /a wpnitemface=0
set /a wpnitemchest=0
set /a wpnitemsweep=0
set /a wpnitemback=0
set /a bleedingweapon=0
set /a itemid=0
set /a xpitemid=1
set /a xpitem=1
set /a efacexp=1
set /a echestxp=1
set /a esweepxp=1
set /a ebackxp=1
if %money% LEQ 10 set /a dropmoney=%random%*3/32767+1
if %money% GTR 10 set /a dropmoney=%random%*4/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:UseXPItemCHMPNB
set /a xpitemchmpnb=%xpitemchmpnb%-1
if %statson%==1 echo %xpitemchmpnb% > "%cd%\data\inv\chnb.data"
set /a xpitemid=2
set /a xpitem=2
set /a givesxp=((2400-%level%*45)/10)
set /a givexp=%givexp%+%givesxp%
set /a efacexp=0
set /a echestxp=0
set /a esweepxp=0
set /a ebackxp=0
if %money% LEQ 20 set /a dropmoney=%random%*3/32767+1
if %money% GTR 20 set /a dropmoney=%random%*4/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck

:OtherItems
color a
set /a item=0
set /a itemmenu=5
cls
echo Your Items:
if %otheritemshatter% GTR 0 echo "Shatter" (x%otheritemshatter%)
echo Say "Exit" to return back to the items menu
set /p item=
goto UseItemCheck
:OtherItems2
echo That wasn't an option, try again.
pause >nul
goto OtherItems

:UseOtherItemShatter
set /a otheritemshatter=%otheritemshatter%-1 
if %statson%==1 echo %otheritemshatter% > "%cd%\data\inv\shtr.data"
set /a cpuitemshattered=1
set /a cpuitemid=0
set /a cpuwpnitemface=0
set /a cpuwpnitemchest=0
set /a cpuwpnitemsweep=0
set /a cpuwpnitemback=0
set /a cpubleedingweapon=0
if %money% LEQ 30 set /a dropmoney=%random%*2/32767+1
if %money% GTR 30 set /a dropmoney=%random%*3/32767+1
if %dropmoney%==1 set /a givemoney=%givemoney%+1
goto ItemCheck 

:Win
set /a pet=0
if %level% GEQ 5 set /a pet=%random%*(500-(%level%*20))/32767+1
set /a losestreak=0
set /a neardeath=0
if %mute%==0 nircmd.exe killprocess wscript.exe
if %statson%==1 echo 0 > "%cd%\data\q.data"
set /a xp=%xp%+%givexp%
set /a totalwins=%totalwins%+1
if %statson%==1 echo %totalwins% > "%cd%\data\tw.data"
if %overkill% GEQ 10 set /a overkill=%overkill%/2
if %overkill% GEQ 10 set /a xp=%xp%+%overkill%
if NOT %level%==%maxlevel% if %health% LEQ 20 set /a neardeath=(%health%-20)*-1
if %level% GEQ 10 set /a neardeath=%neardeath%/2
set /a xp=%xp%+%neardeath%
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
set /a money=%money%+%givemoney%
if %statson%==1 echo %money% > "%cd%\data\mn.data"
goto Win2

:Win2
cls
echo You've sucessfully defeated your opponent and won the fight!
if %givemoney%==0 echo You've been given %givexp% XP!
if %givemoney% GTR 0 echo You've been given %givexp% XP AND $%givemoney%!
if %overkill% GEQ 10 echo OVERKILL BONUS: %overkill% XP
if %neardeath% GTR 0 echo NEAR DEATH BONUS: %neardeath% XP
timeout 1 /nobreak >nul
pause
if %pet%==1 goto EarnedPet
if %xp% GEQ %nlvlxp% goto LevelUp
if %statson%==1 goto StatsOn
goto Menu

:Tied
set /a losestreak=0
if %mute%==0 nircmd.exe killprocess wscript.exe
if %statson%==1 echo 0 > "%cd%\data\q.data"
if %level% LEQ 10 set /a givexp=%givexp%/2
if %level% GTR 10 set /a givexp=%givexp%/4
if NOT %level%==1 set /a givexp=%givexp%-(%level%/2)
set /a xp=%xp%+%givexp%
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
set /a totalwins=%totalwins%+1
if %statson%==1 echo %totalwins% > "%cd%\data\tw.data"
if %statson%==1 echo 1 > "%cd%\data\ko.data"
set /a totaldefeats=%totaldefeats%+1
if %statson%==1 echo %totaldefeats% > "%cd%\data\td.data"
set /a givemoney=%givemoney%/2
set /a money=%money%+%givemoney%
if %statson%==1 echo %money% > "%cd%\data\mn.data"
goto Tied2

:Tied2
cls
echo You both knocked each other out!
echo You both clearly have met your match!
if %givemoney%==0 echo You've been given %givexp% XP!
if %givemoney% GTR 0 echo You've been given %givexp% XP AND $%givemoney%!
timeout 1 /nobreak >nul
pause
goto Defeated3

:Defeated
set /a losestreak=%losestreak%+1
set /a soclose=0
if %mute%==0 nircmd.exe killprocess wscript.exe
if %statson%==1 echo 0 > "%cd%\data\q.data"
if %level% LEQ 10 set /a givexp=%givexp%/10
if %level% GTR 10 set /a givexp=%givexp%/20
if NOT %level%==%maxlevel% if %cpuhealth% LEQ 20 set /a soclose=((%cpuhealth%-20)*-1)/2
if %level% GEQ 10 set /a soclose=%soclose%/2
set /a xp=%xp%+%soclose%
set /a xp=%xp%+%givexp%
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
if %statson%==1 echo 1 > "%cd%\data\ko.data"
set /a totaldefeats=%totaldefeats%+1
if %statson%==1 echo %totaldefeats% > "%cd%\data\td.data"
if %givemoney% GTR 1 (
set /a givemoney=1
) ELSE ( 
set /a givemoney=0
)
set /a money=%money%+%givemoney%
if %statson%==1 echo %money% > "%cd%\data\mn.data"
goto Defeated2

:Defeated2
cls
echo Oh No!
echo You've been defeated! D:
if %givemoney%==0 echo But on the bright side you've been given %givexp% XP
if %givemoney% GTR 0 echo But on the bright side you've been given %givexp% XP AND $%givemoney%!
if %soclose% GTR 0 echo SO CLOSE UGH (BONUS): %soclose% XP
timeout 1 /nobreak >nul
echo Press anything to continue...
timeout 20 >nul
goto Defeated3

:Defeated3
set /a crash=0
echo 0 > "%cd%\data\crash.data"
if %level% GEQ 20 goto DefeatedLvl20
if %level% GEQ 16 goto DefeatedLvl16
if %level% GEQ 12 goto DefeatedLvl12
if %level% GEQ 8 goto DefeatedLvl8
if %level% GEQ 4 goto DefeatedLvl4
cls
echo Please wait 5 seconds to regain conscious
timeout 1 /nobreak >nul
:DefeatedLvl4
cls
echo Please wait 4 seconds to regain conscious
echo Click now to regain conscious faster
timeout 1 >nul
:DefeatedLvl8
cls
echo Please wait 3 seconds to regain conscious
timeout 1 /nobreak >nul
:DefeatedLvl12
cls
echo Please wait 2 seconds to regain conscious
echo Click now to regain conscious faster
timeout 1 >nul
:DefeatedLvl16
cls
echo Please wait 1 seconds to regain conscious
timeout 1 /nobreak >nul
:DefeatedLvl20
if %statson%==1 echo 0 > "%cd%\data\ko.data"
cls
echo You have regained conscious
timeout 0 /nobreak >nul
pause
if %statson%==1 goto StatsOn
goto Menu

:Shop
set /a buy=0
set /a item=0
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                      Shop                                      
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                          Shop                                                          
if %screen%==1 echo ========================================================================================================================
echo Welcome to the item shop, please choose a category!
echo Your current balance is $%money%
echo Say "Weapon" to see all the weapons in the shop
echo Say "Damage" to see all the damage items in the shop
echo Say "Health" to see all the health items in the shop
echo Say "XP" to see all the xp items in the shop
echo Say "Other" to see all other items
echo Say "Exit" to return to the main menu
set /p select=
if /i "%select%"=="Weapon" goto WeaponShop
if /i "%select%"=="Damage" goto DamageShop
if /i "%select%"=="Health" goto HealthShop
if /i "%select%"=="XP" goto XPShop
if /i "%select%"=="Other" goto OtherShop
if /i "%select%"=="Exit" (
if %icr2%==1 goto ItemCheck
goto Menu
)
if %dev%==1 if /i "%select%"=="Death" goto DeathShop

if /i "%select%"=="Stick" goto WeaponShopStick
if /i "%select%"=="Cleats" goto WeaponShopCleats
if /i "%select%"=="Bat" goto WeaponShopBat
if /i "%select%"=="Knife" goto WeaponShopKnife
if /i "%select%"=="Hand Wraps" goto XPShopHandWraps
if /i "%select%"=="Wraps" goto XPShopHandWraps
if /i "%select%"=="Champion's Notebook" goto XPShopCHMPNB
if /i "%select%"=="Champion" goto XPShopCHMPNB
if /i "%select%"=="Notebook" goto XPShopCHMPNB
if /i "%select%"=="Champ" goto XPShopCHMPNB
if /i "%select%"=="NB" goto XPShopCHMPNB
if /i "%select%"=="CNB" goto XPShopCHMPNB
if /i "%select%"=="Grenade" goto DamageShopGrenade
if /i "%select%"=="Grim" goto DamageShopGrim
if /i "%select%"=="Taser" goto DamageShopTaser
if /i "%select%"=="Bottle" goto DamageShopBottle
if /i "%select%"=="Ice" goto DamageShopIce
if /i "%select%"=="Shatter" goto OtherShopShatter
if /i "%select%"=="Minor Heal" goto HealthShopMinorHeal
if /i "%select%"=="Minor" goto HealthShopMinorHeal
if /i "%select%"=="Average Heal" goto HealthShopAverageHeal
if /i "%select%"=="Average" goto HealthShopAverageHeal
if /i "%select%"=="Major Heal" goto HealthShopMajorHeal
if /i "%select%"=="Major" goto HealthShopMajorHeal
if /i "%select%"=="Random Heal" goto HealthShopRandomHeal
if /i "%select%"=="Random" goto HealthShopRandomHeal
if /i "%select%"=="Bandage" goto HealthShopBandage
echo "%select%" isnt a option, try again!
pause >nul
goto Shop

:DamageShop
set /a grenadeprice=6
set /a bottleprice=10
set /a grimprice=16+((%damagelevel%-1)*3)
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                  Damage Items                                  
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                      Damage Items                                                      
if %screen%==1 echo ========================================================================================================================
echo Say the name of an item you'd like to inspect
echo Your current balance is $%money%
echo Say "Grenade" to inspect a grenade ($%grenadeprice%)
echo Say "Bottle" to inspect the bottle item ($%bottleprice%) 
echo Say "Ice" to inspect the ice item ($15) 
echo Say "Taser" to inspect a taser ($16)
if %grimprice% LSS 18 echo Say "Grim" to inspect grim ($%grimprice%)
if %grimprice% GEQ 18 echo Say "Grim" to inspect grim ($%grimprice%)
echo Say "Exit" to return to the shop
set /p item=
if /i "%item%"=="Grenade" goto DamageShopGrenade
if /i "%item%"=="Grim" goto DamageShopGrim
if /i "%item%"=="Taser" goto DamageShopTaser
if /i "%item%"=="Bottle" goto DamageShopBottle 
if /i "%item%"=="Ice" goto DamageShopIce 
if /i "%item%"=="Exit" goto Shop
echo "%item%" isnt a option, try again?
pause >nul
goto DamageShop

:DamageShopGrenade
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Grenade: The grenade can be a real game-changer when in a battle your really losing
echo Deals an instant 16-24 DMG
if %money% LSS %grenadeprice% (
pause
goto DamageShop
)
echo Would you like to buy a Grenade for $%grenadeprice%? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyDamageShopGrenade
if /i "%buy%"=="no" goto DamageShop
echo "%buy%" isnt a option, try again?
pause >nul
goto DamageShopGrenade

:BuyDamageShopGrenade
set /a money=%money%-%grenadeprice%
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a dmgitemgrenade=%dmgitemgrenade%+1
if %statson%==1 echo %dmgitemgrenade% > "%cd%\data\inv\grd.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $%grenadeprice%: Grenade
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto DamageShop

:DamageShopGrim
set /a howmuchdmg=((250+((250/2)*(%damagelevel%-1)))/10)
set /a howmuchheal=%howmuchdmg%/2
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Grim: Grim is a good damage spell that also heals you
echo Deals an instant %howmuchdmg% DMG and heals you %howmuchheal% HP; this changes depending on your damage level
if %money% LSS %grimprice% (
pause
goto DamageShop
)
echo Would you like to buy a Grim for $%grimprice%? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyDamageShopGrim
if /i "%buy%"=="no" goto DamageShop
echo "%buy%" isnt a option, try again?
pause >nul
goto DamageShopGrim

:BuyDamageShopGrim
set /a money=%money%-%grimprice%
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a dmgitemgrim=%dmgitemgrim%+1
if %statson%==1 echo %dmgitemgrim% > "%cd%\data\inv\grm.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $%grimprice%: Grim
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto DamageShop

:DamageShopTaser
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Taser: The taser is amazing for stunning nearly anyone and getting loads of damage on them; but be warned bosses don't stun easily!
echo Deals an 8 DMG and a 0 Percent Stun
if %money% LSS 16 (
pause
goto DamageShop
)
echo Would you like to buy a taser for $16? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyDamageShopTaser
if /i "%buy%"=="no" goto DamageShop
echo "%buy%" isnt a option, try again?
pause >nul
goto DamageShoptaser

:BuyDamageShopTaser
set /a money=%money%-16
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a dmgitemtaser=%dmgitemtaser%+1
if %statson%==1 echo %dmgitemtaser% > "%cd%\data\inv\tsr.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $16: Taser
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto DamageShop

:DamageShopBottle 
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Bottle: Wanna really make your opponent bleed? Just hit em' in the head with a bottle, simple! 
echo Deals an instant 4 DMG and makes your opponent bleed for 4
echo ALSO if you don't have a weapon equipped it'll equip a broken bottle
echo Has a 50% chance of causing bleeding per-hit (33 percent chance of breaking per-round)
echo Face: +1 DMG
echo Chest: +1 DMG
if %money% LSS %bottleprice% ( 
pause 
goto DamageShop 
) 
echo Would you like to buy a bottle for $%bottleprice%? (Current Balance: $%money%) 
set /p buy= 
if /i "%buy%"=="yes" goto BuyDamageShopBottle 
if /i "%buy%"=="no" goto DamageShop 
echo "%buy%" isnt a option, try again? 
pause >nul 
goto DamageShopBottle 
 
:BuyDamageShopBottle 
set /a money=%money%-%bottleprice%
if %statson%==1 echo %money% > "%cd%\data\mn.data" 
set /a dmgitembottle=%dmgitembottle%+1 
if %statson%==1 echo %dmgitembottle% > "%cd%\data\inv\btl.data" 
cls 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $%bottleprice%: Bottle 
echo You now have $%money% 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause 
goto DamageShop 

:DamageShopIce 
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Ice: Is your opponent too fast for you? Slow em' down a bit with some ice! 
echo Deals an instant 4 DMG AND slows opponent down by 1 speed level for 4 rounds
if %money% LSS 15 ( 
pause 
goto DamageShop 
) 
echo Would you like to buy a ice for $15? (Current Balance: $%money%) 
set /p buy= 
if /i "%buy%"=="yes" goto BuyDamageShopIce 
if /i "%buy%"=="no" goto DamageShop 
echo "%buy%" isnt a option, try again? 
pause >nul 
goto DamageShopIce 
 
:BuyDamageShopIce 
set /a money=%money%-15
if %statson%==1 echo %money% > "%cd%\data\mn.data" 
set /a dmgitemice=%dmgitemice%+1 
if %statson%==1 echo %dmgitemice% > "%cd%\data\inv\ic.data" 
cls 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $15: Ice 
echo You now have $%money% 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause 
goto DamageShop 

:WeaponShop
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                  Weapon Items                                  
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                      Weapon Items                                                      
if %screen%==1 echo ========================================================================================================================
echo Say the name of an item you'd like to inspect
echo Your current balance is $%money%
echo Say "Stick" to inspect the stick item ($1)
echo Say "Bat" to inspect the wooden bat item ($6)
echo Say "Cleats" to inspect the cleats item ($6)
echo Say "Knife" to inspect the knife item ($12) 
echo Say "Exit" to return to the shop
set /p item=
if /i "%item%"=="Stick" goto WeaponShopStick
if /i "%item%"=="Cleats" goto WeaponShopCleats
if /i "%item%"=="Bat" goto WeaponShopBat
if /i "%item%"=="Knife" goto WeaponShopKnife 
if /i "%item%"=="Exit" goto Shop
echo "%item%" isnt a option, try again?
pause >nul
goto WeaponShop

:WeaponShopStick
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Stick: The stick is a very weak weapon but can help against small opponents
echo +1 DMG ALL AREAS (FACE, CHEST, SWEEP, BACK)
if %money% LSS 1 (
pause
goto WeaponShop
)
echo Would you like to buy a stick for $1? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyWeaponShopStick
if /i "%buy%"=="no" goto WeaponShop
echo "%buy%" isnt a option, try again?
pause >nul
goto WeaponShopStick

:BuyWeaponShopStick
set /a money=%money%-1
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a wpnitemstick=%wpnitemstick%+1
if %statson%==1 echo %wpnitemstick% > "%cd%\data\inv\stk.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $1: Stick
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto WeaponShop

:WeaponShopBat
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Wooden Bat: Who likes doing sweeps anyways when you can just hit em' right in the stomach?
echo Face: +3 DMG
echo Chest: +3 DMG
echo Back: +2 DMG 
if %money% LSS 6 (
pause
goto WeaponShop
)
echo Would you like to buy a Wooden Bat for $6? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyWeaponShopBat
if /i "%buy%"=="no" goto WeaponShop
echo "%buy%" isnt a option, try again?
pause >nul
goto WeaponShopBat

:BuyWeaponShopBat
set /a money=%money%-6
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a wpnitembat=%wpnitembat%+1
if %statson%==1 echo %wpnitembat% > "%cd%\data\inv\wbt.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $6: Bat
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto WeaponShop

:WeaponShopCleats
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Cleats: Wanna do more damage with your sweeps? Look no further
echo Face: +2 DMG
echo Chest: +2 DMG
echo Sweep: +3 DMG
if %money% LSS 6 (
pause
goto WeaponShop
)
echo Would you like to buy a Cleats for $6? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyWeaponShopCleats
if /i "%buy%"=="no" goto WeaponShop
echo "%buy%" isnt a option, try again?
pause >nul
goto WeaponShopCleats

:BuyWeaponShopCleats
set /a money=%money%-6
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a wpnitemcleats=%wpnitemcleats%+1
if %statson%==1 echo %wpnitemcleats% > "%cd%\data\inv\clts.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $6: Cleats
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto WeaponShop

:WeaponShopKnife 
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Knife: The knife is an amazing medium tier weapon that's helpful for nearly any situation
echo Has a 50% chance of causing bleeding per-hit
echo Face: +3 DMG 
echo Chest: +3 DMG 
echo Sweep: +2 DMG 
echo Back: +4 DMG 
if %money% LSS 12 ( 
pause 
goto WeaponShop 
) 
echo Would you like to buy a knife for $12? (Current Balance: $%money%) 
set /p buy= 
if /i "%buy%"=="yes" goto BuyWeaponShopKnife 
if /i "%buy%"=="no" goto WeaponShop 
echo "%select%" isnt a option, try again? 
pause >nul 
goto WeaponShopKnife 
 
:BuyWeaponShopKnife 
set /a money=%money%-12
if %statson%==1 echo %money% > "%cd%\data\mn.data" 
set /a wpnitemknife=%wpnitemknife%+1 
if %statson%==1 echo %wpnitemknife% > "%cd%\data\inv\knf.data" 
cls 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $12: Knife 
echo You now have $%money% 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause 
goto WeaponShop

:HealthShop
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                  Health Items                                  
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                      Health Items                                                      
if %screen%==1 echo ========================================================================================================================
echo Say the name of an item you'd like to inspect
echo Your current balance is $%money%
echo Say "Minor Heal" to inspect the minor heal item ($4)
echo Say "Bandage" to inspect the bandage item ($8)
echo Say "Average Heal" to inspect the average heal item ($10)
echo Say "Random Heal" to inspect the random heal item ($14)
echo Say "Major Heal" to inspect the major heal item ($16)
echo Say "Exit" to return to the shop
set /p item=
if /i "%item%"=="minor heal" goto HealthShopMinorHeal
if /i "%item%"=="minor" goto HealthShopMinorHeal
if /i "%item%"=="average heal" goto HealthShopAverageHeal
if /i "%item%"=="average" goto HealthShopAverageHeal
if /i "%item%"=="major heal" goto HealthShopMajorHeal
if /i "%item%"=="major" goto HealthShopMajorHeal
if /i "%item%"=="random heal" goto HealthShopRandomHeal
if /i "%item%"=="random" goto HealthShopRandomHeal
if /i "%item%"=="Bandage" goto HealthShopBandage
if /i "%item%"=="Band" goto HealthShopBandage
if /i "%item%"=="Exit" goto Shop
echo "%item%" isnt a option, try again!
pause >nul
goto HealthShop

:HealthShopMinorHeal
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Minor Heal: Good for minor battles you need just a little more health in
echo Heals you 10 Percent - 16 Percent of your health
if %money% LSS 4 (
pause
goto HealthShop
)
echo Would you like to buy a minor heal for $4? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyHealthShopMinorHeal
if /i "%buy%"=="no" goto HealthShop
echo "%buy%" isnt a option, try again?
pause >nul
goto HealthShopMinorHeal

:BuyHealthShopMinorHeal
set /a money=%money%-4
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a healthitemmh=%healthitemmh%+1
if %statson%==1 echo %healthitemmh% > "%cd%\data\inv\mnhl.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $4: Minor Heal
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto HealthShop

:HealthShopAverageHeal
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Average Heal: Good for fighting mini-bosses or just minions your having trouble with
echo Heals you 20 Percent - 30 Percent of your health
if %money% LSS 10 (
pause
goto HealthShop
)
echo Would you like to buy a Average heal for $10? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyHealthShopAverageHeal
if /i "%buy%"=="no" goto HealthShop
echo "%buy%" isnt a option, try again?
pause >nul
goto HealthShopAverageHeal

:BuyHealthShopAverageHeal
set /a money=%money%-10
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a healthitemah=%healthitemah%+1
if %statson%==1 echo %healthitemah% > "%cd%\data\inv\avhl.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $10: Average Heal
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto HealthShop

:HealthShopMajorHeal
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Major Heal: Good for when you're about to lose a hard fight
echo Heals you 30 Percent - 52 Percent of your health
if %money% LSS 16 (
pause
goto HealthShop
)
echo Would you like to buy a Major heal for $16? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyHealthShopMajorHeal
if /i "%buy%"=="no" goto HealthShop
echo "%buy%" isnt a option, try again?
pause >nul
goto HealthShopMajorHeal

:BuyHealthShopMajorHeal
set /a money=%money%-16
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a healthitemmajorheal=%healthitemmajorheal%+1
if %statson%==1 echo %healthitemMajorheal% > "%cd%\data\inv\mjhl.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $16: Major Heal
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto HealthShop

:HealthShopRandomHeal
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Random Heal: Are you a gambling type of person? Like taking some risks? Here's a cheap heal that can screw you over or help a lot!
echo Heals you 8 Percent - 60 Percent of your health
if %money% LSS 14 (
pause
goto HealthShop
)
echo Would you like to buy a Random heal for $14? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyHealthShopRandomHeal
if /i "%buy%"=="no" goto HealthShop
echo "%buy%" isnt a option, try again?
pause >nul
goto HealthShopRandomHeal

:BuyHealthShopRandomHeal
set /a money=%money%-14
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a healthitemrandomheal=%healthitemRandomheal%+1
if %statson%==1 echo %healthitemrandomheal% > "%cd%\data\inv\rndmhl.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $14: Random Heal
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto HealthShop

:HealthShopBandage
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Bandage: Bleeding badly? Just use one of these and you're good to keep fighting!
echo Heals you 14 Percent - 18 Percent of your health and stops all bleeding
if %money% LSS 8 ( 
pause 
goto HealthShop 
) 
echo Would you like to buy a bandage for $8? (Current Balance: $%money%) 
set /p buy= 
if /i "%buy%"=="yes" goto BuyHealthShopBandage 
if /i "%buy%"=="no" goto HealthShop 
echo "%select%" isnt a option, try again? 
pause >nul 
goto HealthShopBandage 

:BuyHealthShopBandage 
set /a money=%money%-8 
if %statson%==1 echo %money% > "%cd%\data\mn.data" 
set /a healthitembandage=%healthitembandage%+1 
if %statson%==1 echo %healthitembandage% > "%cd%\data\inv\bdg.data" 
cls 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $8: Bandage 
echo You now have $%money% 
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause 
goto HealthShop 

:XPShop
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                    XP Items                                    
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                        XP Items                                                        
if %screen%==1 echo ========================================================================================================================
echo Say the name of an item you'd like to inspect
echo Your current balance is $%money%
echo Say "Hand Wraps" to inspect a pair of hand wraps ($1)
echo Say "Champion's Notebook" to inspect a page of a champion's notebook ($20)
echo Say "Exit" to return to the shop
set /p item=
if /i "%item%"=="Hand Wraps" goto XPShopHandWraps
if /i "%item%"=="Wraps" goto XPShopHandWraps
if /i "%item%"=="Champion's Notebook" goto XPShopCHMPNB
if /i "%item%"=="Champion" goto XPShopCHMPNB
if /i "%item%"=="Notebook" goto XPShopCHMPNB
if /i "%item%"=="Champ" goto XPShopCHMPNB
if /i "%item%"=="NB" goto XPShopCHMPNB
if /i "%item%"=="CNB" goto XPShopCHMPNB
if /i "%item%"=="Exit" goto Shop
echo "%item%" isnt a option, try again!
pause >nul
goto XPShop

echo Face: -1 DMG, +1 XP
echo Chest: -1 DMG, +1 XP
echo Sweep: +1 XP
echo Back: -1 DMG, +1 XP

:XPShopHandWraps
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo WARNING: CANNOT USE WITH A WEAPON
echo Hand Wraps: Hand Wraps are great for grinding up just a bit of extra XP
echo Face: +1 XP
echo Chest: +1 XP
echo Sweep: +1 XP
echo Back: +1 XP
if %money% LSS 2 (
pause
goto XPShop
)
echo Would you like to buy Hand Wraps for $1? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyXPShopHandWraps
if /i "%buy%"=="no" goto XPShop
echo "%buy%" isnt a option, try again?
pause >nul
goto XPShopHandWraps

:BuyXPShopHandWraps
set /a money=%money%-1
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a xpitemhandwraps=%xpitemhandwraps%+1
if %statson%==1 echo %xpitemhandwraps% > "%cd%\data\inv\xhw.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $1: Hand Wraps
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto XPShop

:XPShopCHMPNB
set /a givesxp=((2400-%level%*45)/10)
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo WARNING: CANNOT USE IF YOU'VE USED ANY XP ITEM; NO OTHER XP ITEM CAN BE USED AFTER THIS
echo Champion's Notebook: Buy a page from a past champion's notebook
echo Gives an instant %givesxp% XP; this slightly decreases based on your level
if %money% LSS 20 (
pause
goto XPShop
)
echo Would you like to buy a page from a past champion's notebook for $20? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyXPShopCHMPNB
if /i "%buy%"=="no" goto XPShop
echo "%buy%" isnt a option, try again?
pause >nul
goto XPShopCHMPNB

:BuyXPShopCHMPNB
set /a money=%money%-20
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a xpitemchmpnb=%xpitemchmpnb%+1
if %statson%==1 echo %xpitemchmpnb% > "%cd%\data\inv\chnb.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $20: Champion's Notebook
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto XPShop

:OtherShop
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                  Other Items                                  
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                       Other Items                                                       
if %screen%==1 echo ========================================================================================================================
echo Say the name of an item you'd like to inspect
echo Your current balance is $%money%
echo Say "Shatter" to inspect the shatter item ($10)
echo Say "Exit" to return to the shop
set /p item=
if /i "%item%"=="Shatter" goto OtherShopShatter
if /i "%item%"=="Exit" goto Shop
echo "%item%" isnt a option, try again!
pause >nul
goto OtherShop

:OtherShopShatter
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                Item Inspection                                
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                     Item Inspection                                                     
if %screen%==1 echo ========================================================================================================================
echo Shatter: Does your opponent have a really strong weapon? Shatter it with this!
if %money% LSS 10 (
pause
goto OtherShop
)
echo Would you like to buy Shatter for $10? (Current Balance: $%money%)
set /p buy=
if /i "%buy%"=="yes" goto BuyOtherShopShatter
if /i "%buy%"=="no" goto OtherShop
echo "%buy%" isnt a option, try again?
pause >nul
goto OtherShopShatter

:BuyOtherShopShatter
set /a money=%money%-10
if %statson%==1 echo %money% > "%cd%\data\mn.data"
set /a otheritemshatter=%otheritemshatter%+1
if %statson%==1 echo %otheritemshatter% > "%cd%\data\inv\shtr.data"
cls
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo Purchase Successful for $10: Shatter
echo You now have $%money%
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
goto OtherShop

:MaraxFight
cls
echo THIS IS OLD CODE RUNNING, PLEASE REPORT THIS TO THE DEV
pause
goto Menu

:MaraxWin
if %mute%==0 set "file=sounds\marax3.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
if %mute%==0 start /min sound.vbs
if %statson%==1 echo 0 > "%cd%\data\q.data"
set /a givexp=%givexp%-%level%
set /a xp=%xp%+%givexp%
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
set /a totalwins=%totalwins%+1
if %statson%==1 echo %totalwins% > "%cd%\data\tw.data"
goto MaraxWin2

:MaraxWin2
cls
echo You've sucessfully defeated Marax the Crusher and won the fight!
echo You've been rewarded with %givexp% XP!
timeout 1 /nobreak >nul
pause
if %xp% GEQ %nlvlxp% goto LevelUp
if %statson%==1 goto StatsOn
goto Menu

:Quitter
set /a totaldefeats=%totaldefeats%+1
if %statson%==1 echo %totaldefeats% > "%cd%\data\td.data"
set /a quit=0
if %statson%==1 echo 0 > "%cd%\data\q.data"
set /a crash=0
echo 0 > "%cd%\data\crash.data"
cls
echo It seems you quit a game, 1 defeat was added to your stats
pause
if %statson%==1 goto StatsOn
goto Menu

:QuitterPunishment
set /a totaldefeats=%totaldefeats%+1
if %statson%==1 echo %totaldefeats% > "%cd%\data\td.data"
set /a losexp=%level%*2
set /a xp=%xp%-%losexp%
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
set /a quit=0
if %statson%==1 echo 0 > "%cd%\data\q.data"
set /a crash=0
echo 0 > "%cd%\data\crash.data"
cls
echo Don't quit games!
echo You have lost %losexp% XP as punishment!
pause
if %statson%==1 goto StatsOn
goto Menu

:EarnedPet
set /a whichpet=%random%*5/32767+1
if %haspets% GEQ 5 (
if %level% LSS %maxlevel% set /a xp=%xp%+100
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
if %statson%==1 goto StatsOn
goto Menu
)
if %whichpet%==1 if %petjake%==1 goto EarnedPet
if %whichpet%==2 if %pettofu%==1 goto EarnedPet
if %whichpet%==3 if %petbiki%==1 goto EarnedPet
if %whichpet%==4 if %petgobble%==1 goto EarnedPet
if %whichpet%==5 if %petcarius%==1 goto EarnedPet
if %whichpet%==1 (
set /a petjake=1
set "petname=Jake the Cat!"
)
if %whichpet%==2 (
set /a pettofu=1
set "petname=Tofu the Cat!"
)
if %whichpet%==3 (
set /a petbiki=1
set "petname=Biki the Dog!"
)
if %whichpet%==4 (
set /a petgobble=1
set "petname=Gobble the Turkey!"
)
if %whichpet%==5 (
set /a petcarius=1
set "petname=Carius the Demon... (RARE)"
)
if %statson%==1 (
if not EXIST "%cd%\data\pet\" md "%cd%\data\pet\"
if %whichpet%==1 echo 1 > "%cd%\data\pet\pjke.data8432"
if %whichpet%==2 echo 1 > "%cd%\data\pet\ptfu.data9212"
if %whichpet%==3 echo 1 > "%cd%\data\pet\pbki.data5392"
if %whichpet%==4 echo 1 > "%cd%\data\pet\pgbl.data1135"
if %whichpet%==5 echo 1 > "%cd%\data\pet\pcar.data0666"
)
cls
echo You've unlocked %petname%
echo Check out what it can do in the pets menu!
pause
if %statson%==1 goto StatsOn
goto Menu

:Level
if %xp% GEQ %nlvlxp% goto LevelUp
set /a nlvlxp=100+((%level%-1)*75)+((%level%/5)*75)
set /a xpuntillevelup=%nlvlxp%-%xp%
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                                   Level Stats                                  
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                       Level Stats                                                       
if %screen%==1 echo ========================================================================================================================
echo Level Up At: %nlvlxp% XP
echo Level: %level%
echo XP: %xp%
echo You need %xpuntillevelup% more XP to level up!
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
pause
if %statson%==1 goto StatsOn
goto Menu

:LevelUp
set /a previouslevel=%level%
set /a xp=%xp%-%nlvlxp%
set /a xp=%xp%/2
set /a level=%level%+1
set /a points=%points%+1
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
if %statson%==1 echo %level% > "%cd%\data\lvl.data"
if %statson%==1 echo %points% > "%cd%\data\p.data"
set /a nlvlxp=100+((%level%-1)*75)+((%level%/5)*75)
cls                                                                                                                         
echo You leveled up!
echo Your now level %level%!
echo You now have %xp% XP!
if %level%==10 echo Congratulations! You've unlocked "Tournament" mode!
if %level%==4 echo You can now recover in 4 seconds!
if %level%==8 echo You can now recover in 3 seconds!
if %level%==12 echo You can now recover in 2 seconds!
if %level%==16 echo You can now recover in 1 second!
if %level%==20 echo You can now recover instantly!
echo You earned 1 point!
echo You now have a total of %points% point(s)!
echo You need %nlvlxp% XP to level up again!
timeout 2 /nobreak > nul
timeout 1 > nul
pause
goto Points

:Points
if %points% LSS 1 goto NoPoints
cls
echo What would you like to spend your skill point on?
echo Skill Points Avaliable: %points%
if %healthlevel%==1 echo Say "Health" to upgrade health from level 1 to level 2 (1 Point) (125 HP) +25 HP
if %damagelevel%==1 echo Say "Damage" to upgrade damage from level 1 to level 2 (1 Point)
if %healthlevel%==2 echo Say "Health" to upgrade health from level 2 to level 3 (2 Point) (175 HP) +50 HP
if %damagelevel%==2 echo Say "Damage" to upgrade damage from level 2 to level 3 (2 Point)
if %healthlevel%==3 echo Say "Health" to upgrade health from level 3 to level 4 (2 Point) (225 HP) +50 HP
if %healthlevel%==4 echo Say "Health" to upgrade health from level 4 to level 5 (2 Point) (275 HP) +50 HP
if %healthlevel%==5 echo Say "Health" to upgrade health from level 5 to level 6 (2 Point) (320 HP) +45 HP
if %level% GEQ 5 if %speedlevel%==1 echo Say "Speed" to upgrade speed from level 1 to level 2 (2 Point)
if NOT %level% GEQ 5 if %speedlevel%==1 echo Say "Speed" to upgrade speed from level 1 to level 2 (2 Points / LVL 5+)
if %damagelevel%==3 echo Say "Damage" to upgrade damage from level 3 to level 4 (3 Point)
echo Say "Exit" to return to the main menu
if %healthlevel% LSS 5 echo Health Level: %healthlevel%
if %healthlevel%==5 echo Health Level: %healthlevel% (MAX)
if %damagelevel% LSS 4 echo Damage Level: %damagelevel%
if %damagelevel%==4 echo Damage Level: %damagelevel% (MAX)
if %speedlevel% LEQ 2 echo Speed Level: %speedlevel%
if %speedlevel%==3 echo Speed Level: %speedlevel% (MAX)
set /p spend=
if /i "%spend%"=="damage" if %damagelevel%==1 goto UpgradeDamage
if /i "%spend%"=="damage" if %damagelevel%==2 if %points% GTR 1 goto UpgradeDamage
if /i "%spend%"=="damage" if %damagelevel%==3 if %points% GTR 2 goto UpgradeDamage
if /i "%spend%"=="health" if %healthlevel%==1 goto UpgradeHealth
if /i "%spend%"=="health" if %healthlevel%==2 if %points% GTR 1 goto UpgradeHealth
if /i "%spend%"=="health" if %healthlevel%==3 if %points% GTR 2  goto UpgradeHealth
if /i "%spend%"=="health" if %healthlevel%==4 if %points% GTR 3  goto UpgradeHealth
if /i "%spend%"=="speed" if %level% GEQ 5 if %speedlevel%==1 if %points% GTR 1 goto UpgradeSpeed
if /i "%spend%"=="exit" if %statson%==1 goto StatsOn
if /i "%spend%"=="exit" goto Menu
echo Either "%spend%" isn't a option or you don't have enough points, try again.
pause
goto Points

:NoPoints
cls
echo You don't have any points to spend
echo Come back when you do!
pause
if %statson%==1 goto StatsOn
goto Menu

:UpgradeHealth
if %healthlevel% GEQ 6 goto MaxHealthLevel

if %healthlevel%==1 set /a points=%points%-1
if %healthlevel%==2 set /a points=%points%-2
if %healthlevel%==3 set /a points=%points%-2
if %healthlevel%==4 set /a points=%points%-2
if %healthlevel%==5 set /a points=%points%-2

if %statson%==1 echo %points% > "%cd%\data\p.data"
set /a healthlevel=%healthlevel%+1
if %statson%==1 echo %healthlevel% > "%cd%\data\hl.data"
cls
echo Your health level has been upgraded to %healthlevel%!
pause
if %points% GEQ 1 goto Points
if %statson%==1 goto StatsOn
goto Menu

:MaxHealthLevel
cls
echo Your health is max level already! (6)
echo Try spending your point on something else
pause
goto Points

:UpgradeDamage
if %damagelevel% GEQ 4 goto MaxDamageLevel

if %damagelevel%==1 set /a points=%points%-1
if %damagelevel%==2 set /a points=%points%-2
if %damagelevel%==3 set /a points=%points%-3

if %statson%==1 echo %points% > "%cd%\data\p.data"
set /a damagelevel=%damagelevel%+1
if %statson%==1 echo %damagelevel% > "%cd%\data\dl.data"
cls
echo Your damage level has been upgraded to %damagelevel%!
pause
if %points% GEQ 1 goto Points
if %statson%==1 goto StatsOn
goto Menu

:MaxDamageLevel
cls
echo Your damage is max level already! (4)
echo Try spending your point on something else
pause
goto Points

:UpgradeSpeed
if %speedlevel% GEQ 3 goto MaxSpeedLevel
set /a points=%points%-2
if %statson%==1 echo %points% > "%cd%\data\p.data"
set /a speedlevel=%speedlevel%+1
if %statson%==1 echo %speedlevel% > "%cd%\data\sl.data"
cls
echo Your speed level has been upgraded to %speedlevel%!
pause
if %points% GEQ 1 goto Points
if %statson%==1 goto StatsOn
goto Menu

:MaxSpeedLevel
cls
echo Your speed is max level already! (3)
echo Try spending your point on something else
pause
goto Points

:Cheater
set /a cheat=%cheat%+1
if %statson%==1 echo %cheat% > "%cd%\data\working.data"
cls
echo Anti-Cheat Detected a Cheat!
echo Cheating is NOT allowed
pause
goto Welcome

:Banned
cls
echo You have been banned forever by Anti-Cheat
echo Cheating is NOT allowed
echo Click anything to exit the game.
pause >nul
exit

:Error1A
cls
echo Error 1A - Loading Error
echo Please report this to my website
start http://newdavidsprograms.weebly.com/contact-me.html
pause
if %statson%==1 goto StatsOn
goto Menu

:Error1B
set /a crash=0
echo 0 > "%cd%\data\crash.data"
cls
echo Error 1B - Missing File
echo Try re-downloading Master Fighter
echo Missing Files:
echo ===============================================================================
if not EXIST "%cd%\data\lvl.data" echo lvl.data
if not EXIST "%cd%\data\xp.data" echo xp.data
if not EXIST "%cd%\data\p.data" echo p.data
if not EXIST "%cd%\data\ko.data" echo ko.data
if not EXIST "%cd%\data\q.data" echo q.data
if not EXIST "%cd%\data\td.data" echo td.data
if not EXIST "%cd%\data\tw.data" echo tw.data
if not EXIST "%cd%\data\working.data" echo working.data
if not EXIST "%cd%\data\hl.data" echo hl.data
if not EXIST "%cd%\data\dl.data" echo dl.data
if not EXIST "%cd%\data\mn.data" echo mn.data
if not EXIST "%cd%\data\sl.data" echo sl.data
if not EXIST "%cd%\data\inv\stk.data" echo stk.data
if not EXIST "%cd%\data\mute.data" echo mute.data
if not EXIST "%cd%\data\crash.data" echo crash.data
if not EXIST "%cd%\data\screen.data" echo screen.data
if not EXIST "%cd%\data\tut.data" echo tut.data
if not EXIST "%cd%\data\tstg.data" echo tstg.data
if not EXIST "%cd%\data\inv\stk.data" echo stk.data
if not EXIST "%cd%\data\inv\clts.data" echo clts.data
if not EXIST "%cd%\data\inv\knf.data" echo knf.data
if not EXIST "%cd%\data\inv\grd.data" echo grd.data
if not EXIST "%cd%\data\inv\grm.data" echo grm.data
if not EXIST "%cd%\data\inv\tsr.data" echo tsr.data
if not EXIST "%cd%\data\inv\mnhl.data" echo mnhl.data
if not EXIST "%cd%\data\inv\avhl.data" echo avhl.data
if not EXIST "%cd%\data\inv\mjhl.data" echo mjhl.data
if not EXIST "%cd%\data\inv\rndmhl.data" echo rndmhl.data
if not EXIST "%cd%\data\inv\bdg.data" echo bdg.data
if not EXIST "%cd%\data\inv\xhw.data" echo xhw.data
if not EXIST "%cd%\data\inv\chnb.data" echo chnb.data
if not EXIST "%cd%\data\inv\shtr.data" echo shtr.data
if not EXIST "%cd%\data\inv\btl.data" echo btl.data
if not EXIST "%cd%\data\inv\ic.data" echo ic.data 
echo Would you like to try to recreate these file(s)?
echo Say "Yes" or "No"
set /p answer=
if /i "%answer%"=="Yes" goto Error1BFix
if /i "%answer%"=="No" goto Error1BMoreOptions
echo That wasnt a option, try again.
pause
goto Error1B

:Error1BFix
if not EXIST "%cd%\data\lvl.data" echo 1 > "%cd%\data\lvl.data"
if not EXIST "%cd%\data\xp.data" echo 0 > "%cd%\data\xp.data"
if not EXIST "%cd%\data\p.data" echo 0 > "%cd%\data\p.data"
if not EXIST "%cd%\data\ko.data" echo 0 > "%cd%\data\ko.data"
if not EXIST "%cd%\data\q.data" echo 0 > "%cd%\data\q.data"
if not EXIST "%cd%\data\td.data" echo 0 > "%cd%\data\td.data"
if not EXIST "%cd%\data\tw.data" echo 0 > "%cd%\data\tw.data"
if not EXIST "%cd%\data\working.data" echo 0 > "%cd%\data\working.data"
if not EXIST "%cd%\data\hl.data" echo 1 > "%cd%\data\hl.data"
if not EXIST "%cd%\data\dl.data" echo 1 > "%cd%\data\dl.data"
if not EXIST "%cd%\data\sl.data" echo 1 > "%cd%\data\sl.data"
if not EXIST "%cd%\data\mute.data" echo 0 > "%cd%\data\mute.data"
if not EXIST "%cd%\data\crash.data" echo 0 > "%cd%\data\crash.data"
if not EXIST "%cd%\data\screen.data" echo 1 > "%cd%\data\screen.data"
if not EXIST "%cd%\data\tut.data" echo 0 > "%cd%\data\tut.data"
if not EXIST "%cd%\data\tstg.data" echo 0 > "%cd%\data\tstg.data"
if not EXIST "%cd%\data\inv\stk.data" echo 0 > "%cd%\data\inv\stk.data"
if not EXIST "%cd%\data\inv\clts.data" echo 0 > "%cd%\data\inv\clts.data"
if not EXIST "%cd%\data\inv\knf.data" echo 0 > "%cd%\data\inv\knf.data"
if not EXIST "%cd%\data\inv\mnhl.data" echo 0 > "%cd%\data\inv\mnhl.data"
if not EXIST "%cd%\data\inv\avhl.data" echo 0 > "%cd%\data\inv\avhl.data"
if not EXIST "%cd%\data\inv\mjhl.data" echo 0 > "%cd%\data\inv\mjhl.data"
if not EXIST "%cd%\data\inv\rndmhl.data" echo 0 > "%cd%\data\inv\rndmhl.data"
if not EXIST "%cd%\data\inv\bdg.data" echo 0 > "%cd%\data\inv\bdg.data"
if not EXIST "%cd%\data\inv\xhw.data" echo 0 > "%cd%\data\inv\xhw.data"
if not EXIST "%cd%\data\inv\chnb.data" echo 0 > "%cd%\data\inv\chnb.data"
if not EXIST "%cd%\data\inv\shtr.data" echo 0 > "%cd%\data\inv\shtr.data"
if not EXIST "%cd%\data\inv\btl.data" echo 0 > "%cd%\data\inv\btl.data"
if not EXIST "%cd%\data\inv\ic.data" echo 0 > "%cd%\data\inv\ic.data"
if not EXIST "%cd%\data\lvl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\xp.data" goto Error1BNotFixed
if not EXIST "%cd%\data\p.data" goto Error1BNotFixed
if not EXIST "%cd%\data\ko.data" goto Error1BNotFixed
if not EXIST "%cd%\data\q.data" goto Error1BNotFixed
if not EXIST "%cd%\data\td.data" goto Error1BNotFixed
if not EXIST "%cd%\data\tw.data" goto Error1BNotFixed
if not EXIST "%cd%\data\working.data" goto Error1BNotFixed
if not EXIST "%cd%\data\hl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\dl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\mn.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\stk.data" goto Error1BNotFixed
if not EXIST "%cd%\data\sl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\mute.data" goto Error1BNotFixed
if not EXIST "%cd%\data\crash.data" goto Error1BNotFixed
if not EXIST "%cd%\data\screen.data" goto Error1BNotFixed
if not EXIST "%cd%\data\tut.data" goto Error1BNotFixed
if not EXIST "%cd%\data\tstg.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\stk.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\clts.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\knf.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\mnhl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\avhl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\mjhl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\rndmhl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\bdg.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\xhw.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\chnb.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\shtr.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\btl.data" goto Error1BNotFixed
if not EXIST "%cd%\data\inv\ic.data" goto Error1BNotFixed
cls
echo The files were recreated!
pause
if %statson%==1 goto StatsOn
goto Menu

:Error1BNotFixed
cls
echo The files failed to recreate!
echo Choose a number to choose what to do! (Say 1 or 2)
echo 1: Load game anyways without missing files (Better but might not work)
echo 2: Load game with saved data off
set /p answer=
if /i "%answer%"=="1" set /a falsepositive=1
if /i "%answer%"=="2" goto StatsOff
if %falsepositive%==1 goto StatsOn
echo That wasnt a option, try again.
pause
goto Error1BNotFixed

:Error1BMoreOptions
cls
echo If you don't want to try to recreate files which option would you like to try?
echo Choose a number to choose what to do. (Say 1 or 2)
echo 1: Load game anyways without missing files (Better but might not work)
echo 2: Load game with saved data off
set /p answer=
if /i "%answer%"=="1" (
set /a falsepositive=1
goto StatsOn
)
if /i "%answer%"=="2" goto StatsOff
echo That wasnt a option, try again.
pause
goto Error1BMoreOptions

:Crashed
set /a crash=0
if %statson%==1 echo 0 > "%cd%\data\crash.data"
cls
echo Your game crashed while loading! D:
echo You might need to reset your game!
echo Choose a number to choose what to do!
echo 1: Reset the game
echo 2: Try to load the game again
echo 3: Launch the game with saved data off
set /p reset=
if /i "%reset%"=="1" goto Reset
if /i "%reset%"=="2" goto StatsOn
if /i "%reset%"=="3" goto StatsOff
echo That wasn't an option, please try again.
pause
goto Crashed

:Tutorial
set /a input=0
if %tutorial%==0 (
set /a tutorial=1
if %statson%==1 echo 1 > "%cd%\data\tut.data"
)
cls
echo Would you like to play the tutorial/backstory?
set /p input=
if /i "%input%"=="yes" goto Tut1
if /i "%input%"=="yeah" goto Tut1
if /i "%input%"=="sure" goto Tut1
if /i "%input%"=="no" goto Menu
if /i "%input%"=="nah" goto Menu
echo Please say "Yes" or "No", thank you.
pause >nul
goto Tutorial

:AttacksRef
if %screen%==0 echo Say "Face" to hit your opponent in the face                             (5 DMG)
if %screen%==0 echo Say "Chest" to hit your opponent in the chest                           (4 DMG)
if %screen%==0 echo Say "Sweep" to sweep your opponent                                      (3 DMG)
if %screen%==0 echo Say "Back" to attempt a back attack                     (10 DMG / 6 FAILED DMG)
if %screen%==0 echo Say "Blockface" to counter a face attack                               (10 DMG)
if %screen%==0 echo Say "Blockchest" to counter a chest attack                              (8 DMG)
if %screen%==0 echo Say "Blocksweep" to counter a sweep                                     (6 DMG)
if %screen%==0 echo Say "Blockback" to counter a back attack                               (20 DMG)
if %screen%==1 echo Say "Face" to hit your opponent in the face                                                                      (5 DMG)
if %screen%==1 echo Say "Chest" to hit your opponent in the chest                                                                    (4 DMG)
if %screen%==1 echo Say "Sweep" to sweep your opponent                                                                               (3 DMG)
if %screen%==1 echo Say "Back" to attempt a back attack                                                              (10 DMG / 6 FAILED DMG)
if %screen%==1 echo Say "Blockface" to counter a face attack                                                                        (10 DMG)
if %screen%==1 echo Say "Blockchest" to counter a chest attack                                                                       (8 DMG)
if %screen%==1 echo Say "Blocksweep" to counter a sweep                                                                              (6 DMG)
if %screen%==1 echo Say "Blockback" to counter a back attack                                                                        (20 DMG)
if %screen%==0 echo ==================================Previously===================================
if %screen%==1 echo =======================================================Previously=======================================================
goto Tut0%tut%

:Tut1
cls
timeout 1 >nul
timeout 1 /nobreak >nul
echo Oh well hello there! Welcome to the game!
timeout 4 >nul
timeout 1 /nobreak >nul
echo I'm assuming that you're here cause you're new to the game, right? Great!
timeout 3 >nul
timeout 1 /nobreak >nul
echo If that's the case then we have a lot for you learn today!
timeout 5 >nul
timeout 1 /nobreak >nul
echo And this is %username% right? No? Huh, whatever.
timeout 3 >nul
timeout 1 /nobreak >nul
echo A little bit inconvenient.. but today also just so happens to be the day of the "Master Fighter Championship"
echo so I guess I'll just have to teach you there!
timeout 6 >nul
timeout 1 /nobreak >nul
echo Let's go!
pause
cls
timeout 2 /nobreak >nul
echo Alright we're here, nice.
timeout 2 >nul
timeout 1 /nobreak >nul
echo So back to learning how to fight, you'll love this.
timeout 2 >nul
timeout 1 /nobreak >nul
echo You're one of the strongest people in the industry, and this fight?
echo It'll be no problem with your strength!
timeout 5 >nul
timeout 1 /nobreak >nul
echo I just gotta teach you as the player how to actually play correctly and not get the champion killed!
timeout 6 >nul
timeout 1 /nobreak >nul
if %mute%==1 goto Tut1S
set "file=sounds\bell.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
:Tut1S
timeout 1 /nobreak >nul
set /a wrong=0
:Tut2
cls
echo Alright well that's your call for your first fight, don't worry!
echo I'll be with you to make sure you do everything correctly!
if %wrong%==0 (
timeout 4 >nul
timeout 1 /nobreak >nul
)
echo Say "Ready" whenever you think you're ready to start your first fight of the championship!
set /p input=
if /i "%input%"=="Ready" goto Tut3
set /a wrong=%wrong%+1
if %wrong%==1 echo All you have to do is say "Ready" to continue
if %wrong%==2 echo Just say "Ready" whenever you're ready to continue
if %wrong%==3 echo Yup uh, just say "Ready" I guess...
if %wrong%==4 echo Are you ready yet?
if %wrong%==5 echo Typing "Ready" would be nice of you
if %wrong%==6 echo I'd really respect it if you typed "Ready"
if %wrong%==7 (
echo Soooooo, how's your day been?
timeout 3 /nobreak >nul
echo Wait a minute, I forgot! I don't care! :D
timeout 2 /nobreak >nul
echo Say "Ready"!!!
timeout 2 /nobreak >nul
)
pause
goto Tut2
:Tut3
set /a tut=3
set /a wrong=0
set /a move=0
cls
echo Announcer: "Alright, this one's gonna be a fun one to watch, it's last year's champion vs a newbie!"
timeout 2 >nul
timeout 1 /nobreak >nul
echo Announcer: "Let the fight begin!"
pause
:Tut3A
cls
echo Opponent Class: Normal
echo Player Health: 320
echo Opponent Health: 100
goto AttacksRef
:Tut03

if %wrong%==0 (
echo - Okay so this might look overwhelming at first but don't worry, we'll start out simple!
timeout 8 >nul
timeout 1 /nobreak >nul
echo - So all I want you to do right now is to punch them in the face!
)

set /p move=
if /i "%move%"=="face" set /a move=1
if "%move%"=="1" goto Tut5
set /a wrong=%wrong%+1
if %wrong%==1 echo - Alright so just say "Face", that'll do the trick.
if %wrong%==2 echo - Just say "Face"
if %wrong%==5 echo - You're messing with me right? Just say "Face" and you're good
pause
goto Tut3A

:Tut5
set /a tut=5
set /a wrong=0
if %mute%==1 goto Tut%tut%S
set "file=sounds\punch1.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
if %mute%==1 goto Tut%tut%S
set "file=sounds\punch2.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
start /min sound2.vbs
:Tut5S
cls
echo Opponent Class: Normal
echo Player Health: 316 (Damage Taken: 4)
echo Opponent Health: 95 (Damage Taken: 5)
goto AttacksRef
:Tut05
echo You hit your opponent in the face!
echo Your opponent hit you in the chest! 
if %wrong%==0 (
echo - Nice, I love hitting people in the face! You know what's better then that though?
timeout 3 >nul
timeout 1 /nobreak >nul
echo - Getting a stun on someone, let's go for a sweep stun!
timeout 3 >nul
timeout 1 /nobreak >nul
echo - TIP: You can also use numbers to choose a move
echo - So you can say "1" to do a face punch, "2" for a chest, etc...
)
set /p move=
if /i "%move%"=="sweep" set /a move=3
if "%move%"=="3" goto Tut7
set /a wrong=%wrong%+1
if %wrong%==1 echo - Just say "Sweep" or "3", you got this.
if %wrong%==2 echo - Just say "Sweep"
if %wrong%==4 echo - All you gotta do is say "Sweep"
if %wrong%==5 echo - All you gotta do is type "3"
pause
goto Tut5S

:Tut7
set /a tut=7
set /a wrong=0
if %mute%==1 goto Tut%tut%S
set "file=sounds\sweep1.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
:Tut7S
color b
cls
echo Opponent Class: Normal
echo Player Health: 316
echo Opponent Health: 92 (Damage Taken: 3)
goto AttacksRef
:Tut07
echo You sweeped your opponent!
echo OPPONENT STUNNED!
if %wrong%==0 (
echo - Oh damn! You actually got a stun on em'! That's luck at it's finest right there
echo - And totally not just the game being rigged to do that :/
timeout 6 >nul
timeout 1 /nobreak >nul
echo - But stuns are kind of different in this game
echo - When either of you are stunned it's not guaranteed to last any specific amount of rounds
echo - Stuns can last anywhere from 1-17 rounds. It really depends on what caused the stun
timeout 8 >nul
timeout 1 /nobreak >nul
echo - If you wanna know more about stuns you can check that out in the 'Game Wiki'
echo - But I mean hey, while he's stunned you might as well punch him in the face,
echo - It's not like he can do anything about it!
)
set /p move=
if /i "%move%"=="face" set /a move=1
if "%move%"=="1" goto Tut9
set /a wrong=%wrong%+1
if %wrong%==1 echo - Let's punch him in the face while he's still stunned!
if %wrong%==2 echo - Let's punch him in the "FACE" while he's still stunned!
if %wrong%==3 echo - Say "Face"; come on I thought you would've learned this already
if %wrong%==4 echo - Last reminder: Say "Face"
if %wrong% GEQ 5 echo - Say "Face"
pause
goto Tut7S

:Tut9
color a
set /a tut=9
set /a wrong=0
if %mute%==1 goto Tut%tut%S
set "file=sounds\punch2.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
:Tut9S
cls
echo Opponent Class: Normal
echo Player Health: 316
echo Opponent Health: 87 (Damage Taken: 5)
goto AttacksRef
:Tut09
echo You hit your opponent in the face!
if %wrong%==0 (
echo - Yikes, he's already unstunned! I think he's a little mad cause of that stun!
timeout 4 >nul
timeout 1 /nobreak >nul
echo - Maybe we should try blocking/countering now! Counter a face attack by saying "Blockface"!
)
set /p move=
if /i "%move%"=="blockface" set /a move=5
if "%move%"=="5" goto Tut11
set /a wrong=%wrong%+1
if %wrong%==1 echo - Seriously block your face quick!
if %wrong%==2 echo - SERIOUSLY block your face!! Say "5" or "Blockface"!
if %wrong%==3 echo - I'm waiting.. Just say "5" and you're good, that's all there is to it.
if %wrong%==4 echo - For fuck-sake just block your face already! >:(
pause
goto Tut9S
:Tut11
set /a tut=11
set /a wrong=0
if %mute%==1 goto Tut%tut%S
set "file=sounds\bone1.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
:Tut11S
cls
echo Opponent Class: Normal
echo Player Health: 316
echo Opponent Health: 77 (Damage Taken: 10)
goto AttacksRef
:Tut011
echo Your opponent tried to hit you in the face! (YOU COUNTERED)
if %wrong%==0 (
echo - Awesome! So normally I won't be here to help you cheat and know what your opponent is gonna do next
echo - But as you just saw that counter did did a lot of damage!
timeout 6 >nul
timeout 1 /nobreak >nul
echo Opponent: "Alright enough of warming up, let's speed things up!"
timeout 3 >nul
timeout 1 /nobreak >nul
echo - Looks like it's time for things to get serious, time to speed up to speed 2.
timeout 4 >nul
timeout 1 /nobreak >nul
echo - Speed 2 allows you to do multiple moves in 1 turn
timeout 3 >nul
timeout 1 /nobreak >nul
echo - Let's test it out by doing a face then a chest punch!
)
set /p move=
if /i "%move%"=="face" set /a move=1
if %move%==1 (
echo Now enter your second move!
set /p move2=
)
if /i "%move2%"=="chest" set /a move2=2
if "%move%"=="1" if "%move2%"=="2" goto Tut13
set /a wrong=%wrong%+1
if %wrong%==1 echo - Just punch him in the "face" then in the "chest"
if %wrong%==2 echo - Alright just say "Face" then say "Chest"
if %wrong%==3 echo - You can just say "1" then "2" if you want
if %wrong%==4 echo - You gotta do something like come on!
if %wrong% GEQ 5 echo - Say "Face" then "Chest"
pause
goto Tut11S

:Tut13
set /a tut=13
if %mute%==1 goto Tut%tut%S
set "file=sounds\punch1.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
set "file=sounds\sweep2.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound2.vbs
start /min sound.vbs
:Tut13S
color e
cls
echo Opponent Class: Normal
echo Player Health: 308 (Damage Taken: 8)
echo Opponent Health: 59 (Damage Taken: 18)
goto AttacksRef
:Tut013
echo You hit your opponent in the face!
echo Your opponent sweeped you!
echo SPEED 2: You hit your opponent in the chest!
echo SPEED 2: Your opponent hit you in the face!
echo YOU CRIT (2X DAMAGE)
echo - Woah nice, you crit!
timeout 2 >nul
timeout 1 /nobreak >nul
echo Opponent: "AH! I'LL KILL YOU!"
timeout 3 >nul
timeout 1 /nobreak >nul
echo - Huh, I don't know what's up with him...
timeout 4 >nul
timeout 1 /nobreak >nul
:Tut14
set /a tut=14
set /a wrong=0
:Tut14A
color a
cls
echo Opponent Class: Normal
echo Player Health: 308
echo Opponent Health: 125
goto AttacksRef
:Tut014
if %wrong%==0 (
echo - Wait what?? His health is rising and he appears to be getting stronger too?? Stop him!!
timeout 3 >nul
timeout 1 /nobreak >nul
echo - Quick use this taser item! Say "Items"
)
set /p move=
if /i "%move%"=="Items" goto Tut16
set /a wrong=%wrong%+1
if %wrong%==1 echo - Come on, he appears to be getting stronger, Say "Items"!!
if %wrong%==2 echo - Just say "Items"!
if %wrong%==3 echo - Come on I'm running out of things to say! Say "Items"!!!
if %wrong% GEQ 4 echo - Say "Items"
pause
goto Tut14A
:Tut16
set /a wrong=0
set /a tut=16
:Tut016
cls
echo What item category would you like to use?
echo You can also buy more items by saying "Shop"!
echo Say "Damage" to see all your damage items
echo Say "Exit" to return back to the game
if %wrong%==0 echo - So a taser will stun someone for 0 meaning they'll be stunned for awhile
if %wrong%==0 echo - You can either type "Taser" right now or "Damage" to show all your damage items
set /p item=
if /i "%item%"=="taser" goto Tut18
if /i "%item%"=="damage" goto Tut17
set /a wrong=%wrong%+1
if %wrong%==1 echo - Come on! Let's tase this dude! Say "Taser" or "Damage"!
if %wrong%==2 echo - Tase him, quick! Say "Taser"!
if %wrong%==3 echo - Type "Taser"!
if %wrong%==4 echo - Or "Damage", either works...
pause
goto Tut016
:Tut17
set /a wrong=0
set /a tut=17
:Tut017
cls
echo Your Items:
echo "Taser" (x1)
echo Say "Exit" to return back to the items menu
if %wrong%==0 (
echo - So as you can see these are all your damage items, at the moment you only have one
echo - You should use it, or else we might be in a bit of trouble... To use it type "Taser"
)
set /p item=
if /i "%item%"=="Taser" goto Tut18
set /a wrong=%wrong%+1
if %wrong%==1 echo - I'm just gonna assume you mistyped that, type "Taser".
if %wrong%==2 echo - Please just say "Taser", it's really not that hard.
if %wrong% GEQ 3 echo - Say "Taser" to tase your opponent
pause
goto Tut017
:Tut18
set /a tut=18
cls
echo Opponent Class: Normal
echo Player Health: 308
echo Opponent Health: 125
goto AttacksRef
:Tut018
echo TASER USED: DEALED 8 DMG
echo - What the?! How'd he not get stunned??
timeout 3 >nul
timeout 1 /nobreak >nul
echo - It's almost as if he isn't even human anymore?!
timeout 3 >nul
timeout 1 /nobreak >nul
echo Opponent: "ALL THIS POWER.. I CAN'T CONTROL IT! I'LL DESTROY YOU!! TAKE THIS!"
timeout 5 >nul
timeout 1 /nobreak >nul
set /a tut=19
:Tut19
color d
cls
echo Opponent Class: Normal
echo Player Health: 148 (Damage Taken: 160) (Bleeding: 3)
echo Opponent Health: 125
goto AttacksRef
:Tut019
echo - WHAT?! THIS ISN'T POSSIBLE!! HE'S JUST SUPPOSED TO BE A NORMAL EVERYDAY PERSON?!
echo - HE EVEN CAUSED YOU TO BLEED FROM THAT PUNCH!
timeout 5 >nul
timeout 1 /nobreak >nul
echo Opponent: "I THINK I'M DYING, GIVE ME YOUR HEALTH!"
timeout 5 >nul
timeout 1 /nobreak >nul
set /a tut=20
set /a wrong=0
color a
:Tut20
set /a move=0
set /a move2=0
cls
echo Opponent Class: Normal
echo Player Health: 85 (Damage Taken: 63) (Bleeding: 3)
echo Opponent Health: 185
goto AttacksRef
:Tut020
echo OPPONENT STOLE 60 HEALTH FROM YOU!
if %wrong%==0 (
echo - He shouldn't be able to do this!
timeout 4 >nul
timeout 1 /nobreak >nul
echo - Whatever I guess! Let's just hurry up and finishing this lesson so we can be done with this!!
timeout 5 >nul
timeout 1 /nobreak >nul
echo - Bleeding damages you for whatever your current bleeding number is at
echo - Bleeding has 50 percent chance of slowing down by 1 per-round
timeout 6 >nul
timeout 1 /nobreak >nul
)
echo Opponent: "ENOUGH STANDING AROUND! LET'S FIGHT!"
if %wrong%==0 (
timeout 3 >nul
timeout 1 /nobreak >nul
echo - He seems really out of control!! You got this though!
echo - Just remember what I taught you champion!
)
set /p move=
if /i "%move%"=="Face" set /a move=1
if /i "%move%"=="Chest" set /a move=2
if /i "%move%"=="Sweep" set /a move=3
if /i "%move%"=="Back" set /a move=4
if /i "%move%"=="Blockface" set /a move=5
if /i "%move%"=="Blockchest" set /a move=6
if /i "%move%"=="Blocksweep" set /a move=7
if /i "%move%"=="Blockback" set /a move=8
if %move% GEQ 1 if %move% LEQ 8 goto Tut020A
goto Tut020B
:Tut020A
echo Now enter your second move!
set /p move2=
if /i "%move2%"=="Face" set /a move2=1
if /i "%move2%"=="Chest" set /a move2=2
if /i "%move2%"=="Sweep" set /a move2=3
if /i "%move2%"=="Back" set /a move2=4
if /i "%move2%"=="Blockface" set /a move2=5
if /i "%move2%"=="Blockchest" set /a move2=6
if /i "%move2%"=="Blocksweep" set /a move2=7
if /i "%move2%"=="Blockback" set /a move2=8
if %move2% GEQ 1 if %move2% LEQ 8 goto Tut21
:Tut020B
set /a wrong=%wrong%+1
if %wrong%==1 echo You can do any move you want now, just defeat him!
if %wrong%==2 echo Say a number from 1-8 and you're good
if %wrong%==3 echo Can't choose one? Alright, just say "2".
if %wrong%==4 echo Come on just choose something! Your choice doesn't even matter!
if %wrong%==5 echo Literally no matter what you choose you lose, now say "1" alright god damnit!
if %wrong%==6 echo Okay then.. I'm done, if you get this wrong now it'll literally force you to continue!
if %wrong%==7 (
set /a move=1
set /a move2=1
goto Tut21
)
pause
goto Tut20
:Tut21
set /a tut=21
if %move% GTR 4 if %move2% GTR 4 goto Tut%tut%S
if %mute%==1 goto Tut%tut%S
set "file=sounds\bone1.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 1
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
:Tut21S
if %move%==1 set /a cpumove=5
if %move%==2 set /a cpumove=6
if %move%==3 set /a cpumove=7
if %move%==4 set /a cpumove=8
if %move%==5 set /a cpumove=2
if %move%==6 set /a cpumove=1
if %move%==7 set /a cpumove=1
if %move%==8 set /a cpumove=1
if %move2%==1 set /a cpumove2=5
if %move2%==2 set /a cpumove2=6
if %move2%==3 set /a cpumove2=7
if %move2%==4 set /a cpumove2=8
if %move2%==5 set /a cpumove2=2
if %move2%==6 set /a cpumove2=1
if %move2%==7 set /a cpumove2=1
if %move2%==8 set /a cpumove2=1
color c
cls
echo Opponent Class: Normal
echo Player Health: 0 (Damage Taken: 88)
echo Opponent Health: 185
goto AttacksRef
:Tut021
if %move%==1 echo You tried to hit your opponent in the face! (COUNTERED)
if %move%==2 echo You tried to hit your opponent in the chest! (COUNTERED)
if %move%==3 echo You tried to sweep your opponent! (COUNTERED)
if %move%==4 echo You attempted to attack your opponent from behind and succeeded! (COUNTERED)
if %move%==5 echo You blocked your face!
if %move%==6 echo You blocked your chest!
if %move%==7 echo You blocked your feet!
if %move%==8 echo You blocked your back!
if %cpumove%==1 echo Your opponent hit you in the face!
if %cpumove%==2 echo Your opponent hit you in the chest! 
if %cpumove%==3 echo Your opponent sweeped you!
if %move2%==1 echo You tried to hit your opponent in the face! (COUNTERED)
if %move2%==2 echo You tried to hit your opponent in the chest! (COUNTERED)
if %move2%==3 echo You tried to sweep your opponent! (COUNTERED)
if %move2%==4 echo You attempted to attack your opponent from behind and succeeded! (COUNTERED)
if %move2%==5 echo You blocked your face!
if %move2%==6 echo You blocked your chest!
if %move2%==7 echo You blocked your feet!
if %move2%==8 echo You blocked your back!
if %cpumove2%==1 echo Your opponent hit you in the face!
if %cpumove2%==2 echo Your opponent hit you in the chest! 
if %cpumove2%==3 echo Your opponent sweeped you!
echo You've been defeated
timeout 4 >nul
timeout 2 /nobreak >nul
goto Tut22

:Tut22
cls
echo Announcer: "Uh, well then.."
timeout 2 >nul
timeout 1 /nobreak >nul
echo Announcer: "It appears our champion has been defeated in round 1.."
timeout 3 >nul
timeout 1 /nobreak >nul
echo Announcer: "What a certainly unexpected outcome.."
timeout 4 >nul
timeout 3 /nobreak >nul
cls
echo You've lost the tournament..
pause
color a
cls
echo Shortly after losing the tournament you stopped fighting for a few years..
timeout 3 >nul
timeout 1 /nobreak >nul
echo You forgot nearly everything about how to fight the way you did..
timeout 4 >nul
timeout 1 /nobreak >nul
echo Depressed from your loss, you planned to retire from fighting for good but then one day you were rewatching-
echo your loss for the 13th time
timeout 5 >nul
timeout 1 /nobreak >nul
echo You realised something wrong with your opponent in the video..
timeout 4 >nul
timeout 1 /nobreak >nul
echo It's almost as if half way through the battle your opponent was possessed and gained uncontrollable strength
timeout 4 >nul
timeout 1 /nobreak >nul
echo You think this loss couldn't have been your fault
timeout 3 >nul
timeout 1 /nobreak >nul
echo Something or someone was helping him win this battle. Trying to ruin you, but why?
timeout 4 >nul
timeout 1 /nobreak >nul
echo You couldn't figure out a reason but you knew one thing for sure..
timeout 4 >nul
timeout 1 /nobreak >nul
echo You weren't gonna let this be the end of your fighting career, in fact..
timeout 4 >nul
timeout 1 /nobreak >nul
echo You're gonna train for this years tournament and become the champion again!
timeout 2 >nul
timeout 1 /nobreak >nul
pause
set /a wrong=0
:Tut23
cls
if %screen%==0 echo ===============================================================================
if %screen%==0 echo                            Master Fighter Main Menu                            
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
if %screen%==1 echo                                                Master Fighter Main Menu                                                 
if %screen%==1 echo ========================================================================================================================
echo Don't give up!
if %screen%==0 echo =====================================Stats=====================================
if %screen%==1 echo ==========================================================Stats=========================================================
echo Level: 1
echo XP: 0
echo Money: $0
echo Health Level: 1
echo Damage Level: 1
echo Speed Level: 1
echo You have lost 1 match
if %screen%==0 echo ===============================================================================
if %screen%==1 echo ========================================================================================================================
echo - To begin battling and start your training say "Start", then you're on your own! Good luck!
echo Say "Start" to start playing the game
if %wrong%==9 (
set /p input=Start
goto Tut23
)
set /p input=
if /i "%input%"=="Start" goto Tut24
if /i "%input%"=="1" goto Tut24
set /a wrong=%wrong%+1
if %wrong%==1 echo We gotta start to prepare for this years tournament! Say "Start"!
if %wrong%==2 echo Simply say "Start" to begin playing the game.
if %wrong%==3 echo You get 50 free XP once you say "Start" for the first time
if %wrong%==4 echo I'm not joking that's 50 XP on the table
if %wrong%==5 echo Don't wanna take it? I can revoke it
if %wrong%==6 echo Say "Start" now or else I'll keep the 50 XP for myself :/
if %wrong%==7 (
set /a tutorial=2
if %statson%==1 echo 2 > "%cd%\data\tut.data"
echo Alright, that 50 XP was on you buddy. Now just say "Start"
)
if %wrong%==8 echo I'm about to say "Start" for you
pause
goto Tut23
:Tut24
if %tutorial%==1 (
set /a xp=%xp%+50
if %statson%==1 echo %xp% > "%cd%\data\xp.data"
set /a tutorial=2
if %statson%==1 echo 2 > "%cd%\data\tut.data"
)
if %level%==1 if %xp% LEQ 50 goto LoadEClass
if %statson%==1 goto StatsOn
goto Menu