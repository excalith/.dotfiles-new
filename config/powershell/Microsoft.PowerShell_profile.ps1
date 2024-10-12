# Commands
Set-Alias -Name lg -Value 'lazygit'
Set-Alias -Name ld -Value 'lazydocker'
Set-Alias -Name nano -Value 'micro'
Set-Alias -Name eza -Value 'eza --group-directories-first -laho --no-user --icons --git --git-repos --time-style relative'
Set-Alias -Name exa -Value 'eza --group-directories-first -laho --no-user --icons --git --git-repos --time-style relative'

# Make a new directory and cd into it
function mkcd {
    if ($args.Count -eq 0) {
        Write-Host "ERROR: No directory name specified." -ForegroundColor Red
        return
    }
    $dir = $args[0]
    if (Test-Path $dir) {
        Write-Warning "Directory $dir already exists."
    } else {
        mkdir $dir > $null
    }
    Set-Location $dir
}

# Create a new file
function touch {
    if ($args.Count -eq 0) {
        Write-Host "ERROR: No file specified." -ForegroundColor Red
        return
    }
    $path = $args[0]
    if (Test-Path $path) {
        Write-Warning "File $path already exists."
    } else {
        New-Item -ItemType File -Path $path > $null
        Write-Host "SUCCESS: File $path created."  -ForegroundColor Green
    }
}

# Reload Powershell profile
function sreload {
    if (Test-Path $PROFILE) {
        . $PROFILE
        Write-Host "SUCCESS: PowerShell profile reloaded." -ForegroundColor Green
    } else {
        Write-Warning "PowerShell profile not found."
    }
}

# Update PowerShell
function supdate {
    $packages = @(
        "Microsoft.Powershell",
        "chrisant996.Clink",
        "Starship.Starship"
    )

    foreach ($package in $packages) {
        Write-Output "Checking for upgrades for $package"
        & winget upgrade --id $package --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Output "Upgrade completed for $package`n"
        } else {
            Write-Output "No available upgrade found for $package or upgrade failed.`n"
        }
    }
}

function pupdate {
    Write-Output "Upgrading all winget packages...`n"
    & winget upgrade --all --accept-source-agreements --accept-package-agreements 
    if ($LASTEXITCODE -eq 0) {
        Write-Output "All packages upgraded successfully.`n"
    } else {
        Write-Output "Some packages failed to upgrade or no upgrades were available.`n"
    }
}


# Common directories
function dotfiles { Set-Location -Path "$env:USERPROFILE\.dotfiles\$args" }
function dropbox { Set-Location -Path "$env:USERPROFILE\Dropbox\$args" }

# Easy navigation
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }
function ..... { Set-Location ../../../.. }

# Init Starship
Invoke-Expression (&starship init powershell)