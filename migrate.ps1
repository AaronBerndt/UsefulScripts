$Files = Get-ChildItem -Path "src" -Filter "*.tsx" -Depth 4


foreach($File in $Files){
  $IncludesString = Select-String -Path $File -Pattern "useLocation"
  if($IncludesString -ne $null){
   # Write-Host($File)
   $FileContent = Get-Content -path $File -Raw
   (($FileContent) -replace 'navigate.push','navigate') | Set-Content -Path $File
  }
}
