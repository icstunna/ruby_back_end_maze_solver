Pseudocode for changing game from finite state to vectored state

Input: Array of Mirrors
Output: The location of the final laser

1) Find the starting position of the laser
2) Determine the direction of the laser
3) Does the lasers path encounter any mirrors? Possibly create a method to check its path for mirrors
4) If the laser encounters a mirror then calculate the area traversed, change its direction and recheck its path for any mirrors it may encounter
5) If the laser encounters no mirror end the program

*** Current vector solution works for approximation however fails to identify correct area traversed or correct ending location ***