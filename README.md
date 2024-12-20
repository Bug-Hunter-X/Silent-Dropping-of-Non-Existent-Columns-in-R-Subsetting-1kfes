This repository demonstrates a common, yet often overlooked, error in R: the silent dropping of non-existent columns when subsetting data frames using character vectors.  The `bug.r` file shows the problematic code, while `bugSolution.r` provides solutions to handle this issue gracefully.

This behavior is not immediately obvious and can lead to subtle errors that are difficult to detect.  The provided solutions highlight methods to prevent this silent failure and ensure robust data manipulation.