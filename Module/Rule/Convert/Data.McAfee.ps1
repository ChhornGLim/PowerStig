# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

<#
    Instructions:  Use this file to add/update/delete regsitry expressions that are used accross 
    multiple technologies files that are considered commonly used.  Enure expressions are listed
    from MOST Restrive to LEAST Restrictive, similar to exception handling.  Also, ensure only
    UNIQUE Keys are used in each hashtable to prevent errors and conflicts.
#>
$global:SingleLineRegistryPath += [ordered]@{
    McAfee1 = [ordered]@{
        Join   = 'HKLM\\Software\\Wow6432Node\\McAfee'
        Select = 'HKLM\\Software\\Wow6432Node\\McAfee.*(?=\s*Criteria)'
    }
}

$global:SingleLineRegistryValueName += [ordered]@{
    McAfee1 = [ordered]@{
        Match  = 'HKLM\\Software\\Wow6432Node\\McAfee'
        Select = '(?<=If the (|value\s)(|of\s|for\s))\w*?(?=\s(is|does|>=))'
    }
}

$global:SingleLineRegistryValueType += [ordered]@{
    McAfee1 = [ordered]@{
        Add = '(?<=If the (|value\s)(|of\s|for\s){0}[^>=]*("|))\d+'
    }
    McAfee2 = [ordered]@{
        Select = '(?<=If the value of {0} >= to\s)\w+'
    }
}

$global:SingleLineRegistryValueData += [ordered]@{
    McAfee1 = [ordered]@{
        Add    = '(?<=If the (|value\s)(|of\s|for\s){0}[^>=]*("|))\d+'
        Select = '(?<=If the (|value\s)(|of\s|for\s){0}[^>=]*("|))\d+'
    }
}