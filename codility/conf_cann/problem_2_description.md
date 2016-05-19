We are given a string S representing a phone number, which we would like to reformat. String S consists of N characters: digits, spaces and/or dashes. It contains at least two digits.

Spaces and dashes in string S can be ignored. We want to reformat the given phone number in such a way that the digits are grouped in blocks of length three, separated by single dashes. If necessary, the final block or the last two blocks can be of length two.

For example, given sntring S = "00-44   48 5555 8361" we would like to format it as "004-448-555-583-61".

Write a function:

    `function solution(S);`

that, given a string S representing a phone number, returns this phone number reformatted as described above.

For example, given S = "00-44   48 5555 8361"
