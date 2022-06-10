$diagReport = get-content C:\code\github\adventofcode\powershell\2021_day_3\puzzle_input.csv
$diagReportArray = @()
$gammaRateArray = @()
$epsilonRateArray = @()
foreach ($line in $diagReport) {
    $charArray = $line.ToCharArray()
    $diagReportArray += ,@($charArray)
}
for ($column = 0; $column -lt $charArray.Length; $column++)
{
    $columnSum = 0
    for ($row = 0; $row -lt $diagReportArray.Length;$row++) {
        if ($diagReportArray[$row][$column] -eq '1') {
            $columnSum++
        }
    }
    if ($columnSum -gt $diagReportArray.Length/2) {
        $gammaRateArray++
        
    }
    else {
        
        $epsilonRateArray++
    }
}
$gammaRate = $gammaRateArray -join ''
$epsilonRate = $epsilonRateArray -join ''
$powerConsumption = [convert]::ToInt32($gammaRate,2)*[convert]::ToInt32($epsilonRate,2)
$powerConsumption



