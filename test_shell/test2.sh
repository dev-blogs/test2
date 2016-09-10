# watchfor: cледит за входом в систему

old=/tmp/watchfor1.$$
new=/tmp/watchfor2.$$

>$old

while :
do
	who > $new
	diff $old $new
	mv $new $old
	sleep 1
done | awk '/>/ { $1 = "in:		"; print }
			/</ { $1 = "out:	"; print }'