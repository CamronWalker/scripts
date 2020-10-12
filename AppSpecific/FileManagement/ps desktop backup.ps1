# By Camron 2019-03-04 run using:
# powershell -ExecutionPolicy ByPass -File '.\ps desktop backup.ps1'

# Get Date and Format
$DateStr = get-date -format "yyyy-MM-dd" 
Write-Output "Desktop Backup on $DateStr" 

# Get current users environment variables
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocumentsPath = [Environment]::GetFolderPath("MyDocuments")

# Set directory strings
$BackupFolder = "$DocumentsPath\Desktop Backup\Desktop Backup $DateStr"
$MainBackupFolder = "$DocumentsPath\Desktop Backup"
Write-Output "$DesktopPath"
Write-Output "$BackupFolder"

# Create necessary directories if they don't exist
if(!(Test-Path -Path $MainBackupFolder )){
    New-Item -ItemType directory -Path $MainBackupFolder
}

if(!(Test-Path -Path $BackupFolder )){
    New-Item -ItemType directory -Path $BackupFolder
}

# Move all items off of desktop and into backup folder
Get-ChildItem -Path "$DesktopPath" -Recurse |  Move-Item -Destination "$BackupFolder"

# Refresh Desktop Icons
# https://stackoverflow.com/questions/9986869/force-the-icons-on-the-desktop-to-refresh-after-deleting-items-or-stop-an-item
$code = @'
  [System.Runtime.InteropServices.DllImport("Shell32.dll")] 
  private static extern int SHChangeNotify(int eventId, int flags, IntPtr item1, IntPtr item2);

  public static void Refresh()  {
      SHChangeNotify(0x8000000, 0x1000, IntPtr.Zero, IntPtr.Zero);    
  }
'@

Add-Type -MemberDefinition $code -Namespace WinAPI -Name Explorer 

[WinAPI.Explorer]::Refresh()