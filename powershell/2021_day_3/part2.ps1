$diagReport = get-content C:\code\github\adventofcode\powershell\2021_day_3\puzzle_input.csv
$diagReportArray = @()
$diagReportArray2 = @()
$oxygenGeneratorRatingArray = @()
$CO2ScrubberRatingArray = @()
foreach ($line in $diagReport) {
    $charArray = $line.ToCharArray()
    $diagReportArray += , @($charArray)
}
$diagReportArray2 = $diagReportArray
for ($column = 0; $column -lt $charArray.Length; $column++) {
    $columnSum = 0
    for ($row = 0; $row -lt $diagReportArray.Length; $row++) {
        if ($diagReportArray[$row][$column] -eq '1') {
            $columnSum++
        }
    }
    if ($columnSum -ge $diagReportArray.Length / 2) {
        for ($row = 0; $row -lt $diagReportArray.Length; $row++) {
            if ($diagReportArray[$row][$column] -eq '1') {
                $oxygenGeneratorRatingArray += , $diagReportArray[$row]
            }
        }
    }
    else {
        for ($row = 0; $row -lt $diagReportArray.Length; $row++) {
            if ($diagReportArray[$row][$column] -eq '0') {
                $oxygenGeneratorRatingArray += , $diagReportArray[$row]
            }
        }
    }
    if ($oxygenGeneratorRatingArray.Length -eq 1) {
        $oxygenGeneratorRating = $oxygenGeneratorRatingArray[0] -join ''
        $oxygenGeneratorRating = [convert]::ToInt32($oxygenGeneratorRating, 2)
        break
    }
    $diagReportArray = $oxygenGeneratorRatingArray
    $oxygenGeneratorRatingArray = @()
}

for ($column = 0; $column -lt $charArray.Length; $column++) {
    $columnSum = 0
    for ($row = 0; $row -lt $diagReportArray2.Length; $row++) {
        if ($diagReportArray2[$row][$column] -eq '1') {
            $columnSum = $columnSum + 1
        }
    }
    if ($columnSum -ge $diagReportArray2.Length / 2) {
        for ($row = 0; $row -lt $diagReportArray2.Length; $row++) {
            if ($diagReportArray2[$row][$column] -eq '0') {
                $CO2ScrubberRatingArray += , $diagReportArray2[$row]

            }
            else {

            }
        }
    }
    else {
        for ($row = 0; $row -lt $diagReportArray2.Length; $row++) {
            if ($diagReportArray2[$row][$column] -eq '1') {
                $CO2ScrubberRatingArray += , $diagReportArray2[$row]
            }
        }
    }
    if ($CO2ScrubberRatingArray.Length -eq 1) {
        $CO2ScrubberRating = $CO2ScrubberRatingArray[0] -join ''
        $CO2ScrubberRating = [convert]::ToInt32($CO2ScrubberRating, 2)
        $lifeSupportRating = $CO2ScrubberRating * $oxygenGeneratorRating
        $lifeSupportRating
        break
    }
    $diagReportArray2 = $CO2ScrubberRatingArray
    $CO2ScrubberRatingArray = @()

}





