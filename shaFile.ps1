function Get-OnlyFileSha1($filePath) {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
    
    $sha1 = New-Object System.Security.Cryptography.SHA1Managed
    $hash = $sha1.ComputeHash($fileBytes)

    $smallHashSB = New-Object System.Text.StringBuilder
    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $smallHashSB.Append($hexaNotation) > $null
    }

    return $smallHashSB.ToString()
}

function Get-FileSHA1 ($filePath) {
    if ($null -ne $filePath) {
        return Get-OnlyFileSha1($filePath)
    } else {
        $list = New-Object System.Collections.ArrayList
        foreach ($item in $input) {
            $hash = Get-OnlyFileSha1($item) 
            $list.Add( $hash ) > $null
        }
    }
    $list
}

function Get-FileSHA256 ($filePath) {
    $fileContent = Get-Content $filePath

    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
    
    $sha1 = New-Object System.Security.Cryptography.SHA256Managed
    $hash = $sha1.ComputeHash($fileBytes)

    $smallHashSB = New-Object System.Text.StringBuilder
    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $smallHashSB.Append($hexaNotation) > $null
    }

    return $smallHashSB.ToString()
}