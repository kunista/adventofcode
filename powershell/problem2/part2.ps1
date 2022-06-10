<#
.SYNOPSIS
    This script is to resolve problem descibed in Advent Of code 2015 Day 2 Part 2

.DESCRIPTION
    The elves are also running low on ribbon. Ribbon is all the same width, so they only have to worry about the length they need to order, which they would again like to be exact.

The ribbon required to wrap a present is the shortest distance around its sides, or the smallest perimeter of any one face. Each present also requires a bow made out of ribbon as well; the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present. Don't ask how they tie the bow, though; they'll never tell.

For example:

A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to wrap the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total of 34 feet.
A present with dimensions 1x1x10 requires 1+1+1+1 = 4 feet of ribbon to wrap the present plus 1*1*10 = 10 feet of ribbon for the bow, for a total of 14 feet.
How many total feet of ribbon should they order?
    https://adventofcode.com/2015/day/1

.NOTES 
    Author: Roman Orlov
    DateCreated: 2022-04-28
#>
$listOfPresentDimensions = get-content C:\code\github\adventofcode\powershell\problem2\puzzle_input.csv
$multiDimensionalArrayOfPresentDimensions = @()
foreach ($line in $listOfPresentDimensions) {
    $multiDimensionalArrayOfPresentDimensions += ,@($line -split 'x')
}
$sum = 0
foreach ($line in $multiDimensionalArrayOfPresentDimensions) {
    $lw = 1*$line[0]+$line[1]
    $wh = 1*$line[1]+$line[2]
    $hl = 1*$line[2]+$line[0]
    $sideArray = $lw, $wh, $hl
    $minSide = $sideArray | Measure-Object -Minimum
    $sum += 2*$minSide.Minimum + 1*$line[0]*$line[1]*$line[2]
}
$sum