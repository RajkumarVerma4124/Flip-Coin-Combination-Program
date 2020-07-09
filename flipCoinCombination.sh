#-------------------------------------------------------------------------------------------------------------------------------------------

#/bin/bash -x 

declare -A flipCoinCombination

getFlipCoins(){

	numberOfCombination=$1
	combinationOfCoin=""
	
	for((i=1;i<$flipCount;i++))
	do
		for((j=1;j<=$numberOfCombination;j++))
		do
			flipCoin=$(( $RANDOM % 2 ))
			
			if [ $flipCoin -eq 1 ]
			then
				combinationOfCoin=$combinationOfCoin"H"
			else
				combinationOfCoin=$combinationOfCoin"T"
			fi
		done
		
		flipCoinCombination[$combinationOfCoin]=$(( ${flipCoinCombination[$combinationOfCoin]} + 1 ))
		echo $combinationOfCoin  "    "  ${flipCoinCombination[$combinationOfCoin]}

		combinationOfCoin=""
	done

	getWinningCombination

}

getWinningCombination(){

	for i in ${!flipCoinCombination[@]}
	do
		facesCount=${flipCoinCombination[$i]}
		echo " $i  $((( $facesCount * 100 ) / $flipCount )) % "	
	done | sort -k2 -nr | awk 'NR==1{print     $1 "        " $2 }' 


}


read -p "Enter The No. Of Time You Want To Flip a coin : " flipCount
	
while true 
do
	echo -e " 1.To Get Singlet\n 2.To Get Doublet\n 3.To Get Triplet\n 4.Exit "
	read -p "Enter The Choice From Above Option : " choice
		
	case $choice in
		"1") getFlipCoins 1 
		break
		;;

		"2") getFlipCoins 2
		break
		;;

		"3") getFlipCoins 3
		break
		;;
		
		"4") exit
		break
		;;

		*)
		echo "Invalid Choice"
		;;
	esac
done
