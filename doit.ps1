# WORK IN PROGRESS - USE ONLY IF YOU KNOW WHAT IT DOES: LOD Bias is not setting correctly. I'm not sure why. Any help would be great!
# Valheim Graphics Quality Configuration Script (Updated Version)

# Constants
$RegistryPath = "HKCU:\Software\IronGate\Valheim"
$BackupDirectory = "$env:USERPROFILE\Desktop\ValheimRegistryBackup"

# Function to retrieve system specifications
function Get-SystemSpecs {
    try {
        $cpu = (Get-CimInstance -ClassName Win32_Processor).Name
        $ramBytes = (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object Capacity -Sum).Sum
        $ramGB = [math]::Round($ramBytes / 1GB, 2)
        $gpu = (Get-CimInstance -ClassName Win32_VideoController | Select-Object -First 1).Name
        return @{
            CPU = $cpu
            RAM = $ramGB
            GPU = $gpu
        }
    } catch {
        Write-Error "Failed to retrieve system specifications: $_"
        exit 1
    }
}

# Function to determine the recommended graphics quality based on RAM
function Get-RecommendedQuality {
    param (
        [int]$RamSizeGB
    )

    if ($RamSizeGB -lt 8) {
        return 'VeryLow'
    } elseif ($RamSizeGB -lt 16) {
        return 'Balanced'
    } elseif ($RamSizeGB -lt 32) {
        return 'Quality'
    } else {
        return 'Custom'
    }
}

# Function to prompt the user for graphics quality
function Get-UserQualityChoice {
    $systemSpecs = Get-SystemSpecs

    Write-Host "Detected System Specs:"
    Write-Host "CPU: $($systemSpecs.CPU)"
    Write-Host "RAM: $($systemSpecs.RAM) GB"
    Write-Host "GPU: $($systemSpecs.GPU)"
    Write-Host ""

    # Suggest quality level based on RAM
    $ramSize = [int]$systemSpecs.RAM
    $recommendedLevel = Get-RecommendedQuality -RamSizeGB $ramSize
    $recommendedChoice = switch ($recommendedLevel) {
        'VeryLow' { '1' }
        'Balanced' { '2' }
        'Quality' { '3' }
        'Custom' { '4' }
    }

    Write-Host "Recommended Graphics Quality Level: $recommendedLevel"
    Write-Host ""
    Write-Host "Choose your preferred graphics quality level:"
    Write-Host "1. Very Low - Optimizes for performance"
    Write-Host "2. Balanced - Balanced"
    Write-Host "3. Quality  - Optimizes for visuals"
    Write-Host "4. Custom   - Customize individual settings"
    Write-Host "(Press Enter to select the recommended option: $recommendedLevel)"
    Write-Host ""

    while ($true) {
        $input = Read-Host "Enter your choice (1, 2, 3, or 4)"
        if ([string]::IsNullOrWhiteSpace($input)) {
            $input = $recommendedChoice
            break
        }
        if ($input -in '1','2','3','4') {
            break
        }
        Write-Host "Invalid choice. Please enter 1, 2, 3, or 4." -ForegroundColor Yellow
    }

    switch ($input) {
        '1' { return 'VeryLow' }
        '2' { return 'Balanced' }
        '3' { return 'Quality' }
        '4' { return 'Custom' }
        default { return $recommendedLevel }  # Fallback to recommended
    }
}

# Function to retrieve settings based on quality level
function Get-Settings {
    param (
        [Parameter(Mandatory)]
        [ValidateSet('VeryLow', 'Balanced', 'Quality', 'Custom')]
        [string]$Level
    )

    switch ($Level) {
        'VeryLow' {
            return @{
                "GraphicsQualityMode_h1143830910"    = 0                       # Very Low preset
                "AntiAliasing_h2021560769"           = 0
                "Bloom_h211510662"                   = 0
                "ClutterQuality_h3068748133"         = 0
                "DOF_h193444936"                     = 0
                "DistantShadows_h1843906401"         = 0
                "FPSLimit_h2286199605"               = 60                      # Set to 60 FPS
                "Lights_h2893141000"                 = 1
                "LodBias_h1363397339"                = 1
                "MotionBlur_h2158824370"             = 0
                "PointLights_h86280452"              = 0
                "PointLightShadows_h1759565890"      = 0
                "RenderScale_h2780129047"            = 0.6
                "ShadowQuality_h2692908302"          = 0
                "SSAO_h2089437707"                   = 0
                "SunShafts_h4174787446"              = 0
                "Tesselation_h3657420608"            = 0
                "VSync_h223806132"                   = 1
                "SoftPart_h3900822588"               = 0
                "DetailedParticleSystems_h1824948119"= 0
                "ChromaticAberration_h1378604186"    = 0
            }
        }
        'Balanced' {
            return @{
                "GraphicsQualityMode_h1143830910"    = 1                       # Balanced preset
                "AntiAliasing_h2021560769"           = 1
                "Bloom_h211510662"                   = 1
                "ClutterQuality_h3068748133"         = 1
                "DOF_h193444936"                     = 0
                "DistantShadows_h1843906401"         = 1
                "FPSLimit_h2286199605"               = 60                      # Set to 60 FPS
                "Lights_h2893141000"                 = 2
                "LodBias_h1363397339"                = 3
                "MotionBlur_h2158824370"             = 0
                "PointLights_h86280452"              = 1
                "PointLightShadows_h1759565890"      = 1
                "RenderScale_h2780129047"            = 0.8
                "ShadowQuality_h2692908302"          = 1
                "SSAO_h2089437707"                   = 1
                "SunShafts_h4174787446"              = 1
                "Tesselation_h3657420608"            = 0
                "VSync_h223806132"                   = 1
                "SoftPart_h3900822588"               = 0
                "DetailedParticleSystems_h1824948119"= 0
                "ChromaticAberration_h1378604186"    = 0
            }
        }
        'Quality' {
            return @{
                "GraphicsQualityMode_h1143830910"    = 2                       # Quality preset
                "AntiAliasing_h2021560769"           = 1
                "Bloom_h211510662"                   = 1
                "ClutterQuality_h3068748133"         = 2
                "DOF_h193444936"                     = 0
                "DistantShadows_h1843906401"         = 1
                "FPSLimit_h2286199605"               = 60                      # Set to 60 FPS
                "Lights_h2893141000"                 = 2
                "LodBias_h1363397339"                = 5
                "MotionBlur_h2158824370"             = 0
                "PointLights_h86280452"              = 2
                "PointLightShadows_h1759565890"      = 2
                "RenderScale_h2780129047"            = 1.0
                "ShadowQuality_h2692908302"          = 2
                "SSAO_h2089437707"                   = 1
                "SunShafts_h4174787446"              = 1
                "Tesselation_h3657420608"            = 1
                "VSync_h223806132"                   = 1
                "SoftPart_h3900822588"               = 1
                "DetailedParticleSystems_h1824948119"= 1
                "ChromaticAberration_h1378604186"    = 0
            }
        }
        'Custom' {
            return @{
                "GraphicsQualityMode_h1143830910"    = 100                     # Custom mode
                # Here, you can define custom settings or prompt the user for each
                # For simplicity, we'll use 'Ultra' settings as a base
                "AntiAliasing_h2021560769"           = 2
                "Bloom_h211510662"                   = 1
                "ClutterQuality_h3068748133"         = 3
                "DOF_h193444936"                     = 0
                "DistantShadows_h1843906401"         = 1
                "FPSLimit_h2286199605"               = 60                      # Set to 60 FPS
                "Lights_h2893141000"                 = 3
                "LodBias_h1363397339"                = 8
                "MotionBlur_h2158824370"             = 0
                "PointLights_h86280452"              = 3
                "PointLightShadows_h1759565890"      = 3
                "RenderScale_h2780129047"            = 1.2
                "ShadowQuality_h2692908302"          = 3
                "SSAO_h2089437707"                   = 1
                "SunShafts_h4174787446"              = 1
                "Tesselation_h3657420608"            = 1
                "VSync_h223806132"                   = 1
                "SoftPart_h3900822588"               = 1
                "DetailedParticleSystems_h1824948119"= 1
                "ChromaticAberration_h1378604186"    = 0
            }
        }
        default {
            throw "Invalid quality level specified."
        }
    }
}

# Function to backup the registry key
function Backup-RegistryKey {
    param (
        [Parameter(Mandatory)]
        [string]$RegistryPath,

        [Parameter(Mandatory)]
        [string]$BackupPath
    )
    try {
        # Convert PowerShell registry path to reg.exe format
        $regPathForCmd = $RegistryPath -replace "HKCU:\\", "HKEY_CURRENT_USER\"
        reg export "$regPathForCmd" "$BackupPath" /y
        Write-Host "Backup of the registry key created at $BackupPath" -ForegroundColor Green
    } catch {
        Write-Error "Failed to backup the registry key: $_"
    }
}

# Function to ensure the backup directory exists
function Ensure-BackupDirectory {
    if (!(Test-Path -Path $BackupDirectory)) {
        try {
            New-Item -Path $BackupDirectory -ItemType Directory -Force | Out-Null
            Write-Host "Created backup directory at $BackupDirectory" -ForegroundColor Green
        } catch {
            Write-Error "Failed to create backup directory: $_"
            exit 1
        }
    }
}

# Function to apply settings to the registry
function Apply-Settings {
    param (
        [Parameter(Mandatory)]
        [hashtable]$Settings
    )
    try {
        # Verify registry key exists or create it
        if (!(Test-Path -Path $RegistryPath)) {
            try {
                New-Item -Path $RegistryPath -Force | Out-Null
                Write-Host "Created registry key at $RegistryPath." -ForegroundColor Green
            } catch {
                Write-Error "Failed to create registry key: $_"
                exit 1
            }
        }

        # Ensure backup directory exists
        Ensure-BackupDirectory

        # Create a timestamped backup
        $timestamp = Get-Date -Format "yyyyMMddHHmmss"
        $backupPath = Join-Path -Path $BackupDirectory -ChildPath "ValheimRegistryBackup_$timestamp.reg"
        Backup-RegistryKey -RegistryPath $RegistryPath -BackupPath $backupPath

        # Apply each setting
        foreach ($key in $Settings.Keys) {
            $value = $Settings[$key]
            $valueType = $value.GetType().Name

            # Apply the registry value based on its type
            switch ($valueType) {
                'Int32' {
                    Set-ItemProperty -Path $RegistryPath -Name $key -Value $value -Type DWord -ErrorAction Stop
                }
                'UInt32' {
                    Set-ItemProperty -Path $RegistryPath -Name $key -Value $value -Type DWord -ErrorAction Stop
                }
                'Double' {
                    # Convert double to byte array (Little Endian)
                    $bytes = [BitConverter]::GetBytes([double]$value)
                    Set-ItemProperty -Path $RegistryPath -Name $key -Value $bytes -Type Binary -ErrorAction Stop
                }
                'String' {
                    Set-ItemProperty -Path $RegistryPath -Name $key -Value $value -Type String -ErrorAction Stop
                }
                default {
                    Write-Warning "Unhandled data type for $key{$valueType}"
                }
            }
        }
        Write-Host "Settings applied successfully." -ForegroundColor Green

    } catch {
        Write-Error "Failed to apply settings: $_"
    }
}

# Main Execution
while ($true) {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host " Valheim Graphics Quality Configuration " -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Please choose an option:"
    Write-Host "1. Apply New Graphics Quality Settings"
    Write-Host "2. Restore Graphics Settings from Backup"
    Write-Host "3. Exit"
    Write-Host ""

    $userChoice = Read-Host "Enter your choice (1, 2, or 3)"
    Write-Host ""

    switch ($userChoice) {
        '1' {
            # Apply new settings
            $qualityLevel = Get-UserQualityChoice
            Write-Host "Selected Graphics Quality Level: $qualityLevel" -ForegroundColor Cyan
            $settings = Get-Settings -Level $qualityLevel
            Apply-Settings -Settings $settings
            Write-Host ""
        }
        '2' {
            # Restore from backup
            Restore-Settings -RegistryPath $RegistryPath -BackupDir $BackupDirectory
            Write-Host ""
        }
        '3' {
            Write-Host "Exiting the script. Goodbye!" -ForegroundColor Green
            exit
        }
        default {
            Write-Host "Invalid choice. Please select 1, 2, or 3." -ForegroundColor Yellow
            Write-Host ""
        }
    }
}

# Function to restore settings from a backup
function Restore-Settings {
    param (
        [Parameter(Mandatory)]
        [string]$RegistryPath,

        [Parameter(Mandatory)]
        [string]$BackupDir
    )

    # List available backups
    $backups = Get-ChildItem -Path $BackupDir -Filter "*.reg" | Sort-Object LastWriteTime -Descending
    if ($backups.Count -eq 0) {
        Write-Host "No backups available to restore." -ForegroundColor Yellow
        return
    }

    Write-Host "Available Backups:"
    for ($i = 0; $i -lt $backups.Count; $i++) {
        $backup = $backups[$i]
        Write-Host "$($i + 1). $($backup.Name) (Created on $($backup.LastWriteTime))"
    }

    Write-Host ""
    Write-Host "Choose a backup to restore:"
    Write-Host "1. Restore the most recent backup."
    Write-Host "2. Restore from a specific backup file."
    Write-Host "3. Enter a custom backup file path."
    Write-Host "4. Cancel restoration."
    Write-Host ""

    $choice = Read-Host "Enter your choice (1, 2, 3, or 4)"
    switch ($choice) {
        '1' {
            $selectedBackup = $backups[0].FullName
        }
        '2' {
            $backupNumber = Read-Host "Enter the number of the backup you want to restore"
            if ($backupNumber -match '^\d+$' -and ($backupNumber -ge 1) -and ($backupNumber -le $backups.Count)) {
                $selectedBackup = $backups[$backupNumber - 1].FullName
            } else {
                Write-Host "Invalid backup number." -ForegroundColor Yellow
                return
            }
        }
        '3' {
            $selectedBackup = Read-Host "Enter the full path to the backup .reg file"
            if (!(Test-Path -Path $selectedBackup)) {
                Write-Host "The specified backup file does not exist." -ForegroundColor Red
                return
            }
            if ($selectedBackup -notmatch '\.reg$') {
                Write-Host "The specified file is not a .reg file." -ForegroundColor Red
                return
            }
        }
        '4' {
            Write-Host "Restoration canceled by user." -ForegroundColor Cyan
            return
        }
        default {
            Write-Host "Invalid choice. Restoration canceled." -ForegroundColor Yellow
            return
        }
    }

    Write-Host ""
    Write-Host "You have chosen to restore from: $selectedBackup" -ForegroundColor Cyan
    Write-Host "⚠️ Restoring registry settings will overwrite current Valheim graphics settings."
    $confirm = Read-Host "Are you sure you want to proceed? (Y/N)"
    if ($confirm -ne 'Y' -and $confirm -ne 'y') {
        Write-Host "Restoration canceled by user." -ForegroundColor Cyan
        return
    }

    try {
        # Import the .reg file
        reg import $selectedBackup
        Write-Host "Registry settings restored successfully from $selectedBackup." -ForegroundColor Green
    } catch {
        Write-Error "Failed to restore registry settings: $_"
    }
}
