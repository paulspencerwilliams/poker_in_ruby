Feature: several players can play together

@wip
Scenario Outline: two players..
Given Fred has <hand1>
And James has <hand2>
When they show hands
Then the result will be <expected_result>
Examples:
 | hand1            | hand2            |  expected_result                    |
 | "2H 3D 5S 9C KD" | "2C 3H 4S 8C AH" | "James wins. - with high card: Ace" |
 | "2H 4S 4C 2D 4H" | "2S 8S AS QS 3S" | "James wins. - with flash"          |
 | "2H 3D 5S 9C KD" | "2C 3H 4S 8C KH" | "Fred wins. - with high card: 9"    |
 | "2H 3D 5S 9C KD" | "2D 3H 5C 9S KH" | "Tie."                              |
 