function prompt {
	$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
	$CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
	write-host "PS [ " -ForegroundColor darkgreen -nonewline
	Write-Host "$($CmdPromptUser.Name.split("\")[1])@$($CmdPromptUser.Name.split("\")[0])" -ForegroundColor darkmagenta -NoNewline
	write-host " ]-(" -ForegroundColor darkgreen -NoNewLine
	Write-Host " $($executionContext.SessionState.Path.CurrentLocation) "  -ForegroundColor darkmagenta -NoNewline
	write-host ")" -ForegroundColor darkgreen
	write-host "$('$' * ($nestedPromptLevel+1))" -ForegroundColor darkgreen -nonewline
	return " "
}
function start_monerod_func {monerod --config-file='G:\Programs\Monero\XMR_Blockchain\bitmonero.conf'}
set-alias -name start-monerod -value start_monerod_func

function open_monero_wallet_func {monero-wallet-cli --wallet-file 'G:\Programs\Monero\Wallets\win_monero\win_monero'}
set-alias -name open-wallet -value open_monero_wallet_func

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -BellStyle None
