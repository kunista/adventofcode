<#
.SYNOPSIS
    This script is to resolve problem descibed in Advent Of code 2015 Day 2 Part 1 

.DESCRIPTION
    The elves are running low on wrapping paper, and so they need to submit an order for more. They have a list of the dimensions (length l, width w, and height h) of each present, and only want to order exactly as much as they need.

Fortunately, every present is a box (a perfect right rectangular prism), which makes calculating the required wrapping paper for each gift a little easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. The elves also need a little extra paper for each present: the area of the smallest side.

For example:

A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of wrapping paper plus 6 square feet of slack, for a total of 58 square feet.
A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet of wrapping paper plus 1 square foot of slack, for a total of 43 square feet.
All numbers in the elves' list are in feet. How many total square feet of wrapping paper should they order?
    https://adventofcode.com/2015/day/2

.NOTES 
    Author: Roman Orlov
    DateCreated: 2022-04-28
#>
$presentDimensions = get-content C:\code\github\adventofcode\powershell\problem2\puzzle_input.csv
$presentDimensionsArray = @()
foreach ($line in $presentDimensions) {
    $presentDimensionsArray += ,@($line -split 'x')
}
$sum = 0
foreach ($line in $presentDimensionsArray) {
    $lwArea = 1*$line[0]*$line[1]
    $whArea = 1*$line[1]*$line[2]
    $hlArea = 1*$line[2]*$line[0]
    $sideArray = $lwArea, $whArea, $hlArea
    $minSide = $sideArray | Measure-Object -Minimum
    $sum += 2*$lw + 2*$wh + 2*$hl + $minSide.Minimum
}
$sum