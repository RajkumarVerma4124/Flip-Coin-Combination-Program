
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

sortSinglet=$( printf "%s\n" ${flipCoin[*]} | sort -n )
sortdisplayCoinSinglet=$( printf "%s\n" ${displayCoinSinglet[*]} | sort )

echo "Displaying Outcomes Of Coins flipped is After Sorting  : " $sortSinglet
echo "Displaying The singlet of Coins Flipped After Sorting  : " ${sortdisplayCoinSinglet[*]}
printf "\n"

if [ $headCount -gt $tailCount -a $percentHeads -gt $percentTails ] 
then 
	echo "Head Wins with count of : " $headCount "And Percentage Of : " $percentHeads  
elif [ $tailCount -gt $headCount -a $percentTails -gt $percentHeads ] 
then 
	echo "Tail Wins with count of : " $tailCount  "And Percentage Of : " $percentTails
fi 

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

printf "\n"

sortDoublet=$( printf "%s\n" ${flipCoin[*]} | sort -n )
sortdisplayCoinDoublet=$( printf "%s\n" ${displayCoinDoublet[*]} | sort )
echo "Displaying Outcomes Of Coins flipped is After Sorting  : " $sortDoublet
echo "Displaying The Doublet of Coins Flipped After Sorting  : " ${sortdisplayCoinDoublet[*]}
printf "\n"

declare -A doubletArray
doubletArray[1]=$doubleHeadCount
doubletArray[2]=$doubleTailCount
doubletArray[3]=$singleHeadTailCount
doubletArray[4]=$singleTailHeadCount
max=${doubletArray[1]}
for (( i=1;i<5;i++ ))
do
	if [ ${doubletArray[$i]} -gt $max ]
	then
       		max=${doubletArray[$i]}
  	fi
done
  
if [ $max -eq ${doubletArray[1]} ]
then
	echo "HH Combination Wins with count of : " $doubleHeadCount   "And Percentage Of : " $percentDoubleHeadCount
fi

if [ $max -eq ${doubletArray[2]} ]
then
	echo "TT Combination Wins with count of : " $doubleTailCount   "And Percentage Of : " $percentDoubleTailCount
fi

if [ $max -eq ${doubletArray[3]} ]
then
	echo "HT Combination Wins with count of : " $singleHeadTailCount   "And Percentage Of : " $percentSingleHeadTailCount
fi

if [ $max -eq ${doubletArray[4]} ]
then
	echo "TH Combination Wins with count of : " $singleTailHeadCount   "And Percentage Of : " $percentSingleTailHeadCount
fi


printf "\n"
echo "As a simulator, do the same for Triplet Combination. (UC4)"
printf "\n"

read -p "Enter the time you want to flip a coin : " flipCount

HHHCount=0
HHTCount=0
HTHCount=0
HTTCount=0
THHCount=0
THTCount=0
TTHCount=0
TTTCount=0


declare -A displayCoinTriplet

for ((i=0;i<$flipCount;i++))
do
	flipCoin[$i]=$(($RANDOM%8 + 1))
	if [ ${flipCoin[$i]} -eq 1 ]
	then
		displayCoinTriplet[$i]="HHH"
		HHHCount=$(($HHHCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $HHHCount
	elif [ ${flipCoin[$i]} -eq 2 ]
	then
		displayCoinTriplet[$i]="HHT"
		HHTCount=$(($HHTCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $HHTCount
	elif [ ${flipCoin[$i]} -eq 3 ]
	then
		displayCoinTriplet[$i]="HTH"
		HTHCount=$(($HTHCount+1)) 
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $HTHCount
	elif [ ${flipCoin[$i]} -eq 4 ]
	then
		displayCoinTriplet[$i]="HTT"
		HTTCount=$(($HTTCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $HTTCount
	elif [ ${flipCoin[$i]} -eq 5 ]
	then
		displayCoinTriplet[$i]="THH"
		THHCount=$(($THHCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $THHCount
	elif [ ${flipCoin[$i]} -eq 6 ]
	then
		displayCoinTriplet[$i]="THT"
		THTCount=$(($THTCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $THTCount
	elif [ ${flipCoin[$i]} -eq 7 ]
	then
		displayCoinTriplet[$i]="TTH"
		TTHCount=$(($TTHCount+1)) 
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $TTHCount
	elif [ ${flipCoin[$i]} -eq 8 ]
	then
		displayCoinTriplet[$i]="TTT"
		TTTCount=$(($TTTCount+1))
		echo ${flipCoin[$i]}  :  ${displayCoinTriplet[$i]}  :  $TTTCount
	fi  
done

echo "Displaying the Outcomes of flipped coins : " ${flipCoin[*]}
echo "Displaying the Doublets of flipped coins : " ${displayCoinTriplet[*]}


echo "Count of HHH Is : "$HHHCount
echo "Count of HHT Is : "$HHTCount
echo "Count of HTH Is : "$HTHCount
echo "Count of HTT Is : "$HTTCount
echo "Count of THH Is : "$THHCount
echo "Count of THT Is : "$THTCount
echo "Count of TTH Is : "$TTHCount
echo "Count of TTT Is : "$TTTCount



percentOfHHH=$(($HHHCount*100 / $flipCount));
percentOfHHT=$(($HHTCount*100 / $flipCount));
percentOfHTH=$(($HTHCount*100 / $flipCount));
percentOfHTT=$(($HTTCount*100 / $flipCount));
percentOfTHH=$(($THHCount*100 / $flipCount));
percentOfTHT=$(($THTCount*100 / $flipCount));
percentOfTTH=$(($TTHCount*100 / $flipCount));
percentOfTTT=$(($TTTCount*100 / $flipCount));


echo "percent Of HHH IS : $percentOfHHH % "
echo "percent Of HHT IS : $percentOfHHT % "
echo "percent Of HTH IS : $percentOfHTH % "
echo "percent Of HTT IS : $percentOfHTT % "
echo "percent Of THH IS : $percentOfTHH % "
echo "percent Of THT IS : $percentOfTHT % "
echo "percent Of TTH IS : $percentOfTTH % "
echo "percent Of TTT IS : $percentOfTTT % "

sortTriplet=$( printf "%s\n" ${flipCoin[*]} | sort -n )
sortdisplayCoinTriplet=$( printf "%s\n" ${displayCoinTriplet[*]} | sort )

echo "Displaying Outcomes Of Coins flipped is After Sorting  : " $sortTriplet
echo "Displaying The Triplet of Coins Flipped After Sorting  : " ${sortdisplayCoinTriplet[*]}
printf "\n"

declare -A tripletArray
tripletArray[1]=$HHHCount
tripletArray[2]=$HHTCount
tripletArray[3]=$HTHCount
tripletArray[4]=$HTTCount
tripletArray[5]=$THHCount
tripletArray[6]=$THTCount
tripletArray[7]=$TTHCount
tripletArray[8]=$TTTCount
maxTriplet=${tripletArray[1]}

for (( i=1;i<9;i++ ))
do
	if [ ${tripletArray[$i]} -gt $maxTriplet ]
	then
       		maxTriplet=${tripletArray[$i]}
  	fi
done

if [ $maxTriplet -eq ${tripletArray[1]} ]
then
	echo "HHH Combination Wins with count of : " $HHHCount   "And Percentage Of : " $percentOfHHH
fi

if [ $maxTriplet -eq ${tripletArray[2]} ]
then
	echo "HHT Combination Wins with count of : " $HHTCount   "And Percentage Of : " $percentOfHHT
fi

if [ $maxTriplet -eq ${tripletArray[3]} ]
then
	echo "HTH Combination Wins with count of : " $HTHCount   "And Percentage Of : " $percentOfHTH
fi

if [ $maxTriplet -eq ${tripletArray[4]} ]
then
	echo "HTT Combination Wins with count of : " $HTTCount   "And Percentage Of : " $percentOfHTT
fi

if [ $maxTriplet -eq ${tripletArray[5]} ]
then
	echo "THH Combination Wins with count of : " $THHCount   "And Percentage Of : " $percentOfTHH
fi
	
if [ $maxTriplet -eq ${tripletArray[6]} ]
then
	echo "THT Combination Wins with count of : " $THTCount   "And Percentage Of : " $percentOfTHT
fi
	
if [ $maxTriplet -eq ${tripletArray[7]} ]
then
	echo "TTH Combination Wins with count of : " $TTHCount   "And Percentage Of : " $percentOfTTH
fi
	
if [ $maxTriplet -eq ${tripletArray[8]} ]
then
	echo "TTT Combination Wins with count of : " $TTTCount   "And Percentage Of : " $percentOfTTT
fi
	
