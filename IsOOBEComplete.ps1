# This PowerShell script checks if the Windows Out-Of-Box Experience (OOBE) is complete
# by calling a custom C# method that uses the kernel32.dll (via P/Invoke).

# Define a C# class with a method to call the OOBEComplete function from kernel32.dll
$TypeDef = @"
 
using System;
using System.Text;
using System.Collections.Generic;
using System.Runtime.InteropServices;
 
namespace Api
{
 public class Kernel32
 {
   // Import the OOBEComplete function from kernel32.dll
   [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
   public static extern int OOBEComplete(ref int bIsOOBEComplete);
 }
}
"@
 
# Add the C# type to the PowerShell session
Add-Type -TypeDefinition $TypeDef -Language CSharp
 
# Initialize the variable to hold the OOBE completion status
$IsOOBEComplete = $false
# Call the imported OOBEComplete method, passing the variable by reference
$hr = [Api.Kernel32]::OOBEComplete([ref] $IsOOBEComplete)
 
# Output the OOBE completion status (True if complete, False otherwise)
$IsOOBEComplete