@echo off
set COMMAND=$'^
1                                                                                                                   \n^
load cadence                                                                                                        \n^
getConnection() { DATA=`condor_xwin -l ^| grep vnc.i3a.es ^| tail -n 1 ^| cut -d\'(\' -f2 ^| cut -d\')\' -f1`; }    \n^
echo ^>^&2                                                                                                          \n^
                                                                                                                    \n^
echo -n Checking... ^>^&2                                                                                           \n^
getConnection                                                                                                       \n^
if [ ! -z "$DATA" ]; then                                                                                           \n^
        echo ...found! ^>^&2                                                                                        \n^
        echo $DATA                                                                                                  \n^
        exit 14                                                                                                     \n^
fi                                                                                                                  \n^
if [ $^? == 14 ]; then                                                                                              \n^
	exit                                                                                                            \n^
fi                                                                                                                  \n^
echo ...unavailable ^>^&2                                                                                           \n^
                                                                                                                    \n^
echo -n Creating... ^>^&2                                                                                           \n^
condor_xwin -n 1                                                                                                    \n^
echo ...created ^>^&2                                                                                               \n^
                                                                                                                    \n^
echo -n Waiting... ^>^&2                                                                                            \n^
while [ -z "$DATA" ]; do                                                                                            \n^
        sleep 1                                                                                                     \n^
        echo -n . ^>^&2                                                                                             \n^
        getConnection                                                                                               \n^
done                                                                                                                \n^
echo ...ready! ^>^&2                                                                                                \n^
echo $DATA                                                                                                          \n^
'


rem echo "%COMMAND%"
rem ssh hermes.cps.unizar.es "%COMMAND%"


echo Connecting...
for /f %%i in ('ssh hermes.cps.unizar.es "printf %COMMAND% | bash -i"') do (
    echo ^> %%i
    set RESULT=%%i
)
Set RESULT=%RESULT::=::%

echo Opening...
start /b vncviewer64-1.12.0.exe −FullScreen −DotWhenNoCursor -PasswordFile passwd %RESULT%
echo ...done

Set RESULT=

%rem pause