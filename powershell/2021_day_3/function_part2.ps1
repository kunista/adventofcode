Function Get-Rating {
    [cmdletbinding()]
    Param (
        [array]$Array,
        [char]$More, [char]$Fewer
    )
    Process {
        for ($column = 0; $column -lt $charArray.Length; $column++) {
            $columnSum = 0
            for ($row = 0; $row -lt $Array.Length; $row++) {
                if ($Array[$row][$column] -eq '1') {
                    $columnSum++
                }
            }
            if ($columnSum -ge $Array.Length / 2) {
                for ($row = 0; $row -lt $Array.Length; $row++) {
                    if ($Array[$row][$column] -eq $More) {
                        $ratingArray += , $Array[$row]
                    }
                }
            }
            else {
                for ($row = 0; $row -lt $Array.Length; $row++) {
                    if ($Array[$row][$column] -eq $Fewer) {
                        $ratingArray += , $Array[$row]
                    }
                }
            }
            if ($ratingArray.Length -eq 1) {
                $rating = $ratingArray[0] -join ''
                $rating = [convert]::ToInt32($rating, 2)
                return $rating
            }
            $Array = $ratingArray
            $ratingArray = @()
        }
    }
}

$diagReport = get-content C:\code\github\adventofcode\powershell\2021_day_3\puzzle_input.csv
$diagReportArray = @()
foreach ($line in $diagReport) {
    $charArray = $line.ToCharArray()
    $diagReportArray.Add($charArray)
}

$oxygenGeneratorRating = Get-Rating -Array $diagReportArray  -More '1' -Fewer '0'
$CO2ScrubberRating = Get-Rating -Array $diagReportArray  -More '0' -Fewer '1'
$lifeSupportRating = $CO2ScrubberRating * $oxygenGeneratorRating
$lifeSupportRating

        



