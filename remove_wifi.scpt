-- Prompt for the Wi-Fi network name to remove
set networkName to text returned of (display dialog "Enter the name of the Wi-Fi network you want to remove:" default answer "")

-- Confirm the action
set confirm to button returned of (display dialog "Are you sure you want to remove the Wi-Fi network: " & networkName & "?" buttons {"Cancel", "Remove"} default button "Remove")

if confirm is "Remove" then
    -- Run shell command to remove the network
    try
        do shell script "networksetup -removepreferredwirelessnetwork en0 " & quoted form of networkName with administrator privileges
        display dialog "The Wi-Fi network '" & networkName & "' has been removed successfully."
    on error errMsg
        display dialog "Failed to remove the Wi-Fi network. Error: " & errMsg buttons {"OK"} default button "OK"
    end try
end if
