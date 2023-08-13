# RUN POWERSHELL AS ADMIN
param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
Write-Host "`n Running with full privileges ...`r`n"

# UPDATE PYTHON
Write-Host "`n UPDATING PYTHON ...`r`n"
python.exe -m pip install --upgrade pip

# UPDATE SPOTDL 
Write-Host "`n UPDATING SPOTDL ...`r`n"
pip install spotdl -U

# UNCOMMENT TO RUN FOR THE FIRST TIME RUNNING THIS SCRIPT
# Write-Host "`n INSTALLING FFMPEG ...`r`n"		                  # remove first '#' 
# spotdl --download-ffmpeg  				                            # remove first '#'


# MODIFY CODE BELOW TO DOWNLOAD YOUR PLAYLISTS
# JUST MODIFIY WHATS INSIDE ' ' and links

# UPDATE PLAYLISTS
Write-Host "`n UPDATING PLAYLIST 'Bom para Malhar' ...`r`n"				# change to your playlist name
CD 'D:\VITOR-PC\Music\Spotify\Bom pra malhar' 						        # change to where playlist will be saved
spotdl https://open.spotify.com/playlist/2URNknrAZWUZGUQyfNxsc3?si=883bf004a09a4baf 	# change to your spotify playlist link	
spotdl https://open.spotify.com/playlist/2URNknrAZWUZGUQyfNxsc3?si=883bf004a09a4baf 	# just repeat to check items

Write-Host "`n UPDATING PLAYLIST 'Favoritassas' ...`r`n" 
CD 'D:\VITOR-PC\Music\Spotify\Favoritassas'
spotdl https://open.spotify.com/playlist/48IzhYWWb9KwfCkrPtJ1Pk?si=0dbda86ff5bb482b
spotdl https://open.spotify.com/playlist/48IzhYWWb9KwfCkrPtJ1Pk?si=0dbda86ff5bb482b

Read-Host -Prompt "Press Enter to exit"
EXIT
