# Yahtzee in Swift

### Description
This project was created for me to practice Swift and Swift UI. 
Yahtzee is a game of dice where you score points by rolling five dice to make certain combinations.

### Rules

The dice can be rolled up to three times in a turn to try to make a scoring combination.
A game consists of thirteen rounds. After each round, the player chooses with scoring category is going to be used for that round.
Once a category has been used in the game, it cannot be used again, with the exception of Yahtzee.
The first Yahtzee, which is a five-of-a-kind, gives you 50 points, but any subsequent yahtzees will give you 100 points.

#### Scoring Categories

* One to Six: Score the total of all values of that dice
* Three of a kind: Score the total of all five dice if three of them are the same. 
* Four of a kind: Score the total of all five dice if four of them are the same. 
* Full house: Score 25 points if the dice show three of one number and two of another.
* Small straight: Score 30 points if the dice show any sequence of four numbers.
* Large straight: Score 40 points if the dice show any sequence of five numbers.
* Chance: Score the total of all five dice for any combination.
* Yahtzee: Score 50 points if the dice show five of the same number.
  * Any subsequent Yahtzee's will score 100 points   
