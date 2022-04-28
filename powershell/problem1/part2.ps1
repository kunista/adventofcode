<#
.SYNOPSIS
    This script is to resolve problem descibed in Advent Of code 2015 Part 2

.DESCRIPTION
    Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor -1). The first character in the instructions has position 1, the second character has position 2, and so on.

    For example:

    ) causes him to enter the basement at character position 1.
    ()()) causes him to enter the basement at character position 5.
    What is the position of the character that causes Santa to first enter the basement?
    https://adventofcode.com/2015/day/1

.NOTES 
    Author: Roman Orlov
    DateCreated: 2022-04-14
#>
[CmdletBinding()]
param(
    #Directions for Santa.
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[(-)]+$')]
    [String] $Directions
)
$charArray = $Directions.ToCharArray()
$floor = 0
$position = 0
$i = 0
foreach ($char in $charArray) {
    if ($char -eq "(" ) {
        $floor++
    }
    else {
        $floor--
    }
    if ($floor -lt 0) {
        $position = $i + 1
        break
    }
    $i++
}
$position