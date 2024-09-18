######################################################################

gci -Recurse -Include "*out*", "*log*" -Exclude "*access*" | where {$_.LastWriteTime -gt (Get-Date).AddDays(-30)}
gci -Recurse -Include "*out*", "*log*" -Exclude "*access*" | where {$_.LastWriteTime -gt (Get-Date).AddDays(-30)} | Select-String "OutOfMemoryError", "Critical" -SimpleMatch -CaseSensitive
gci -Recurse -Include "*out*", "*log*" -Exclude "*access*" | where {$_.LastWriteTime -gt (Get-Date).AddDays(-30)} | Select-String "OutOfMemoryError" -SimpleMatch -CaseSensitive
gci -Recurse -Include "*out*", "*log*" -Exclude "*access*" | where {$_.LastWriteTime -gt (Get-Date).AddDays(-30)} | Select-String "OutOfMemoryError" -SimpleMatch -CaseSensitive -Context 0,50
