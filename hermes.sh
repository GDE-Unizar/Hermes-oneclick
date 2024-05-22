#!/bin/bash

echo "========== Connecting to SSH =========="
OUTPUT=$(ssh hermes.cps.unizar.es "bash -i" << 'EOF'
1
load cadence
getConnection() { DATA=`condor_xwin -l | grep vnc.i3a.es | tail -n 1 | cut -d'(' -f2 | cut -d')' -f1`; }
echo >&2

echo -n Checking... >&2
getConnection
if [ ! -z "$DATA" ]; then
        echo ...found! >&2
        echo $DATA
        exit 14
fi
if [ $? == 14 ]; then
	exit
fi
echo ...unavailable >&2

echo -n Creating... >&2
condor_xwin -n 1
echo ...created >&2

echo -n Waiting... >&2
while [ -z "$DATA" ]; do
        sleep 1
        echo -n . >&2
        getConnection
done
echo ...ready! >&2
echo $DATA
EOF
)
echo "========== Closed SSH =========="


URL=$(echo "$OUTPUT" | tail -n1)
echo "Connecting to url $URL"
vncviewer -FullScreen -passwordfile -DotWhenNoCursor $HOME/.vnc/passwd $URL
