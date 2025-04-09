echo "Region RTT" > rtt.txt
regions=("us-east-1", "us-east-2", "us-west-1", "us-west-2", "ca-central-1", "ca-west-1", "mx-central-1", "us-gov-east-1", "us-gov-west-1")

endpoints=("ec2.us-east-1.amazonaws.com" "ec2.us-east-2.amazonaws.com" "ec2.us-west-1.amazonaws.com" "ec2.us-west-2.amazonaws.com" "ec2.ca-central-1.amazonaws.com" "ec2.ca-west-1.amazonaws.com" "ec2.mx-central-1.amazonaws.com" "ec2.us-gov-east-1.amazonaws.com" "ec2.us-gov-west-1.amazonaws.com")

for i in "${!regions[@]}"; do
        region="${regions[$i]}"
        endpoint="${endpoints[$i]}"
        echo "Pinging $endpoint for $region"

        rtt_ms=$(ping -c 1 "$endpoint" | grep 'time=' | sed -n 's/.*time=\([0-9.]*\) ms.*/\1/p')

        if [ -z "$rtt_ms" ]; then
                rtt_ms="0.0"
        fi

	echo "$region $rtt_ms" >> rtt.txt

done

gnuplot <<EOF
set terminal png 
set output 'rtt.png'
set title "RTT to AWS regions in North America"
set grid
set style fill solid 1.0 border -1
set boxwidth 0.5
set xtics rotate by -30
plot 'rtt.txt' using 2:xtic(1)  with boxes title 'RTT'
EOF
echo "RTT" measurements saved in rtt.txt and plot saved as "rtt.png" 
