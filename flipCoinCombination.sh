
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
printf "\n"


echo "As a simulator, loop to create a Doublet Combination. Store the doublet combination as well as the percentage." 
echo "Doublet Combinations are HH, HT, TH, and TT (UC3)"

read -p "Enter the time no. of you want to flip a coin : " flipCount

doubleHeadCount=0
doubleTailCount=0
singleHeadTailCount=0
singleTailHeadCount=0

declare -A displayCoinDoublet
count=0
echo "Dsiplaying the Outcomes Doublets and there Counts "
for ((i=0;i<$flipCount;i++))
do
	flipCoin[$i]=$(($RANDOM%4 + 1))
	if [ ${flipCoin[$i]} -eq 1 ]
	then
		displayCoinDoublet[$i]="HH"
		doubleHeadCount=$(($doubleHeadCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinDoublet[$i]}  :  $doubleHeadCount
	elif [ ${flipCoin[$i]} -eq 2 ]
	then
		displayCoinDoublet[$i]="TT"
		doubleTailCount=$(($doubleTailCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinDoublet[$i]}  :  $doubleTailCount
	elif [ ${flipCoin[$i]} -eq 3 ]
	then
		displayCoinDoublet[$i]="HT"	
		singleHeadTailCount=$(($singleHeadTailCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinDoublet[$i]}  :  $singleHeadTailCount
 	elif [ ${flipCoin[$i]} -eq 4 ]
	then
		displayCoinDoublet[$i]="TH"
		singleTailHeadCount=$(($singleTailHeadCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinDoublet[$i]}  :  $singleTailHeadCount
	fi  
done

echo  "Displaying the Outcomes of flipped coins : "${flipCoin[*]}
echo  "Displaying the Doublets of flipped coins : "${displayCoinDoublet[*]}

echo "Count Of HH Is : "$doubleHeadCount
echo "Count Of TT Is : "$doubleTailCount
echo "Count of HT Is : "$singleHeadTailCount
echo "Count of TH Is : "$singleTailHeadCount
printf "\n"

percentDoubleHeadCount=$(($doubleHeadCount*100 / $flipCount));
percentDoubleTailCount=$(($doubleTailCount*100 / $flipCount));
percentSingleHeadTailCount=$(($singleHeadTailCount*100 / $flipCount));
percentSingleTailHeadCount=$(($singleTailHeadCount*100 / $flipCount));

echo "percentage Of HH Is : $percentDoubleHeadCount % "
echo "percentage Of TT Is : $percentDoubleTailCount % "
echo "percentage Of HT Is : $percentSingleHeadTailCount % "
echo "percentage Of TH Is : $percentSingleTailHeadCount % "
