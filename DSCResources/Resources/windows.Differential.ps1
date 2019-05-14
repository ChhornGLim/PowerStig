# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

if ($null -ne $DifferentialConfigurationData)
{
    $scriptBlockString = [System.Text.StringBuilder]::new()
    foreach ($key in $DifferentialConfigurationData.Keys)
    {
        $differentialRule = $stig.RuleList | Where-Object -FilterScript {$PSItem.id -eq $key}

        if ($null -ne $differentialRule)
        {
            $resourceTitle = Get-ResourceTitle -Rule $differentialRule
            [void]$scriptBlockString.AppendLine("$($DifferentialConfigurationData[$key].Keys) `'$resourceTitle`'`n{")
            for ($i = 0; ($DifferentialConfigurationData[$key].Values.Keys.Count - 1) -ge $i; $i++)
            {
                $name = $DifferentialConfigurationData[$key].Values.Keys[$i]
                $value = $DifferentialConfigurationData[$key].Values.Values[$i]
                [void]$scriptBlockString.AppendLine("`t$name = `"$value`"")
            }
            [void]$scriptBlockString.AppendLine('}')
        }
        else
        {
            throw "Rule Id `'$key`' not detected in Processed STIG Data, Check DifferentialConfigurationData and try again"
        }
    }

    $differentialScriptBlock = [scriptblock]::Create($scriptBlockString.ToString())
    $differentialScriptBlock.Invoke()
}
