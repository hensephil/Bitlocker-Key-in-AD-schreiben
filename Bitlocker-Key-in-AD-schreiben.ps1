### Erstellt am 07.04.2021 - Philipp Hense - Zentrale IT NES ###

 


$key = manage-bde -protectors -get c: 
$key = $key.trim() -join ";"
$keymatches = ($key | select-String -pattern "ID: {(?<ID>[0-9ABCDEF-]+)};Kennwort:;(?<K>[0-9-]*)" -AllMatches).Matches
 
$key_id = $keymatches[0].Groups.Item(1).Value
$keymatches[0].Groups.Item(2).Value



manage-bde -protectors -adbackup c: -id "{$key_id}"