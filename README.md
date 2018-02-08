# Word-Guess Game

Create a game which will allow the user to guess a word and get ASCII-art as feedback on their guesses.

### Learning Goals:
- Create a complex program from start to finish
- Use at least one class to encapsulate game functionality
- Use methods to encapsulate repeated sections of code
- Use instance variables and local variables where appropriate
- Use arrays to store information where appropriate
- Use variables to allow the game to be played with different words

### The Rules:
The word to guess is represented by a row of dashes, giving the number of letters. If the guess is a letter or number which occurs in the word, the word should be updated in all of the correct positions. If the suggested letter or number does not occur in the word, the game should draw or remove one element of the visual representation as a tally mark. The game is over when:
  - The player completes the word, or guesses the whole word correctly
  - The diagram representing the tally marks is complete

For example:
```
(@)(@)(@)  
  ,\,\,|,/,/,
     _\|/_
    |_____|
     |   |
     |___|

word: _ O _ D O _
```

## Baseline Discussion
### Phase 1
We can use our understanding of grammar to help us design programs. We will examine our problem space and identify the grammar we use when we describe the problem. **Nouns** are things you can touch, see, smell, taste, or feel. A **verb** is an action. For example, let's say we are describing a problem with a traveling animal: A dog (noun) runs (verb) on four feet (noun).

For this particular word guess problem, create the list of **nouns** and **verbs** that you would utilize in describing this problem. 

### Phase 2
Use your list of **nouns** to begin thinking about what classes you might want to use. Use your list of **verbs** associated with **nouns** to consider what methods you need to put in which classes. This brainstorming process is not a failproof approach, but rather a starting point.

You can review some [additional documentation](https://wbsimms.com/programming-nouns-verbs/) on this approach if you'd like some additional context.

## Baseline Code
1. **One** person in your pair shall `fork` the repository in GitHub
1. **One** person in your pair shall `git clone` the repository to their computer
1. Create a program that will accept one user guess input and print it out in the terminal
1. Use the git `add`, `commit` and `push` commands to push the initial program to GitHub

## Primary Requirements
### Game play
- The user should be able to input a single letter at a time.
- Between each guess, the board should be redrawn to the terminal output (Ascii art!).
- Display the letters that have already been guessed before each player guesses a new letter.
- The user should be able to win or lose.

### Technical
- You should be able to play your game by running it using `ruby` from the terminal.
- Use classes to contain your game logic. You may be able to implement your solution using just one class, but consider how isolating related functionality into separate classes may increase your code's readability and maintainability (single responsibility principle).

## Optional Requirements
- Use the colorize gem to make pieces of the ASCII art a different colors.
- Handle inappropriate user input. For example, what happens when a user enters an exclamation point.
- Ensure the user is not penalized for guessing the same letter more than once.
- Allow the user to choose their difficulty level: higher levels will have words or phrases with more letters. You determine the specific logic that will determine a low, medium, high level.
- Allow the program to accept the whole word as input from the user. If the word is guessed correctly, the user will win. Otherwise, it will be treated as another guess.

## What Intructors Are Looking For
Check out the [feedback template](feedback.md) which lists the items instructors will be looking for as they evaluate your project.
