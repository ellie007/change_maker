# change_maker

My approach to the following:

I felt it rather straightforward until I got to the point of test 4 & 5.
At the beginning, you could easily subtract the highest denomination amount to least denomination amount, and that should address the concern of it dispensing the most efficient dispensation, meaning the least amount of coins.

Upon arriving to test 4 & 5, it seemed two issues needed to be addressed.

1) Having static denominations such as 25, 10, etc. ... will not work anymore.
2) Continuing to have the highest denomination to least denomination value was no longer a valid way to give you the least amount of coins per dispensation.

It became in my head to simply try every permutation of denomination set and create any possible set of dispensation, and have a temp variable hold the most efficient/best one.

I wanted to keep the public part as a simple entry point while abstracting all the other used methods into private encapsulated parts.
