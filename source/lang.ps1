Set-Culture fr-CA
Set-WinSystemLocale fr-CA
Set-WinHomeLocation -GeoID 39
Set-WinUserLanguageList -LanguageList fr-CA -Force 
$currentLangAndKeyboard = (Get-WinUserLanguageList).InputMethodTips

if ($currentLangAndKeyboard -ne "0C0C:00001009")
{
  $langList = New-WinUserLanguageList fr-CA
  $langList[0].InputMethodTips.Clear()
  $langList[0].InputMethodTips.Add('0C0C:00001009') # Francais, Clavier Francais(Canada)
  Set-WinUserLanguageList $langList -Force
}
