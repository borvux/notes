# what is machine learning?
- it's to teach a computer to do something 

## the old way
- it's regular programming, `input` -> `program` -> `result`
- you write the exact instructions 
- but the problem is that this only works for problems that are solved

## the new way
- instead of giving computer a recipe. we show a bunch of examples and let it figure out the recipe on it's own
- instead of saying a cat have "pointy ears" "whiskers" "a tail"
- you just point and say, this is a cat, this is a cat too, this is a dog, this is a cat, ..... for a lot of examples

## how does the computer learn?
- it's a loop
  - `guess`: the computer goes through the pictures and guessing if it's a cat or not,
  - `check`: if it's correct, then we tell the computer it's correct
  - `adjust`: the computer adjust after the checks to guess better next time if there is similar picture
  - `repeat`: for `1-n` times, meaning it can be millions of times
- this whole process is called training

## after training (learned)
- the computer become expert at telling cats from dogs, then it can be used as a `trained model`

---

# what is neural network?
- when you are trying to teach a computer to recognize a cat in a picture
- neural network is like a team of simple guessers all working together
  - first guesser look for pointy ears
  - second guesser look for whiskers
  - third guesser look for fluffy tail
  - and so forth 
- by themselves, each guesser is not very smart, but there is a `team captain`.
- the `team captain` see all the guesses and makes the final decision
  - the `team captain` learns **how much to trust each guesser**, this trust level is called `weight`
  - so some guesser have `higher weight` and some have `lower weight`
- the neural networ is this team, becomes powerful becuase it can learn the perfect `weights` for thousands of these guessers to solve a problem. 
- Makes it very super flexible, you can use the same kind of teams to learn to recognize dogs, cars, or even people's voices, by changing their trust levels aka `weights`
