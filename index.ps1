$ErrorActionPreference = "stop"
$nameExpr = @{
    Label="Nome";
    Expression={ $_.Name }
}

$lengthExp = @{
    Label="Tamanho";
    Expression={ "{0:N1}MB" -f ($_.length) }
}

$params = $nameExpr, $lengthExp;

$fileList = Get-ChildItem .\script -Recurse -File | ? Name -like "*txt1*" | Select-Object $params
return $fileList