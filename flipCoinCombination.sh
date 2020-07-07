
printf "\n"
echo "Flip Coin Simulation Program "
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
printf "\n"

echo "As a Simulator started with Flipping a Cointo Display Heads or Tails (UC1)"

flipCoin=$(( $RANDOM % 2 +1 ))
echo $flipCoin    
if [ $flipCoin -eq 1 ]
then
	echo "Heads"
else
	echo "Tails"
fi

printf "\n"
echo "As a simulator, loop through Multiple times of flipping a coin store the Singlet Combination in a Dictionary." 
echo "Finally determine the percentage of the Singlet Combination. - Singlet shows Heads or Tails (UC2)"

headCount=0
tailCount=0

read -p "Enter the no. of time you want to flip a coin : " flipCount

declare -A flipCoin
declare -A displayCoinSinglet

for ((i=0;i<$flipCount;i++))
do
	flipCoin[$i]=$(($RANDOM%2 + 1))
	if [ ${flipCoin[$i]} -eq 1 ]
	then
		displayCoinSinglet[$i]="H"
		headCount=$(($headCount+1))
	elif [ ${flipCoin[$i]} -eq 2 ]
	then
		displayCoinSinglet[$i]="T"
		tailCount=$(($tailCount+1))
	fi 
done 

echo "Displaying Outcomes Of Coins flipped is : " ${flipCoin[*]}
echo "Displaying The singlet of Coins Flipped : " ${displayCoinSinglet[*]}
echo "Total no. of Head Wins is : "$headCount
echo "Total no. of Tail Wins is : "$tailCount

percentHeads=$(($headCount*100 / flipCount));
percentTails=$(($tailCount*100 / flipCount));

echo "Heads Percentage is : $percentHeads % "
echo "Tails Percentage is : $percentTails % "

