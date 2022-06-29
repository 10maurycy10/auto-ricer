ADDRESS=1.1.1.1
COUNT=10
echo pinging $ADDRESS $COUNT times.
LOSS=$(ping $ADDRESS -c $COUNT -q | grep packet\ loss | awk '{print $6}' | cut -d '%' -f 1)
echo packet loss is $LOSS
(( $LOSS < 50 )) && notify "Packet loss is $LOSS"

