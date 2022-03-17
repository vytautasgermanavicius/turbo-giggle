# General notes

Our APEX coding style was created more than 10 years ago: we are using tabs instead of spaces, `{` allways have new line
before and etc. There are naming conventions, like, controllers must have prefixes `CRTL_` and Test classed must have
prefixes `TEST_`.

# Task 1: Improve Code

> Clone this repository: https://github.com/amanalabs/turbo-giggle
> Refactor the Animal class as needed

First of all: It is not clear purpose of refactoring: what we want to achieve with refactoring? Simplify code? Make code
faster? Less memory consuming? Refactoring for extendability? What can grow number of Animals with the same 3 actions,
or number of Animals wil remain the same, but it may will grow number of different actions. There I made assumption,
that:

* number of methods will not grow
* number of animals will grow

Second: How `Animal`class is used? Is it allowed to make changes how `Animal` class is used? How public methods are
used: There is public method `meow()`, can it be called for `Animal.animalType = 'Horse'`, directly not
via `makeSound()`? There I made assumption, that:

* refactoring should not affect, how class in constructed externally;
* only 3 main methods are used externaly.

Third: it is not clear, does `Animal` class have private data, are these data shared between internal methods. There I
made assumption, that :

* there are no inner data
* methods are independent.

# Task 2: Lightning Web Component

> Create two components:
The first component should display a list of all accounts in the org. The account names should be clickable. The second  
component should display a list of all contacts related to any account the user clicks. Anytime the user clicks an account in the first component, the second component should refresh.

Note: Displaying 'All' records is against Salesforce best practices. It may cause hitting od DML limits.

Task 3: Rollup Trigger

> StandUp makes and sells standing desks to businesses all around the world. Michael Hall, the Founder/CEO and a long-time advocate of environmentally sustainable business practices, decided from the beginning that half of the desks they sell will come from recycled wood. As a result, the company invests a lot in marketing the benefits of these desks in order to meet its 50% goal.

> To better understand the impact of this practice on sales, the executive team wants to see account-level sales summary by wood type. There is an Opportunity field called Wood Type which has a value of "Standard" and "Recycled" to represent the two types of wood the company uses to manufacture desks. Initially, the Salesforce Admin attempted to create two roll-up summary fields on the Account that would summarize sales by wood type. However, the company has reached the total number of roll-up summary fields allowed on the Account object so that was not an option. After exhausting all point-and-click options available for delivering this requirement, the Admin turns to you, the Salesforce Developer, to create a trigger that would meet this need. They give you the following acceptance criteria:

> Sales should be summarized on two Account fields:
Total Sales (Standard Wood)
Total Sales (Recycled Wood)
The summaries should be calculated in real-time. StandUp is an enterprise with large data volumes in its Salesforce org so the trigger should be as efficient as possible.

> Important Notes The goal of this exercise is to understand how you think and to gauge your development skills. The approach you take is more important than the implementation specifics. You may choose to write this in your text editor without deploying to an org if you’d like. Successful compilation is not required. You are free to ask any clarifying questions you need of the Admin before writing the trigger. Code readability and maintainability are very important; do not ignore them. Please write as if your code will be deployed to the production instance of a client with a very complex implementation and large data volumes.
