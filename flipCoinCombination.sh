
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

