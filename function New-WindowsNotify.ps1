function New-WindowsNotify {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$true)]
        [string]$Title,
        [string]$Text,
        [ValidationSet("None","Info","Warning","Error",IgnoreCase = $false)]
        [string]$NotifyType
    )
    
    begin {
        
    }
    
    process {
        Add-Type -AssemblyName System.Windows.Forms 
$global:balloon = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 
$balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::$NotifyType   
$balloon.BalloonTipText = $Text
$balloon.BalloonTipTitle = $Title
$balloon.Visible = $true 
$balloon.ShowBalloonTip(5000)
        
    }
    
    end {
        
    }
}

