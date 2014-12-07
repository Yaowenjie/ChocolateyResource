# DSC uses the Get-TargetResource function to fetch the status of the resource instance specified in the parameters for the target machine
function Get-TargetResource
{
    param 
    (       
        [ValidateSet("Present", "Absent")]
        [string]$Ensure = "Present",

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

        $getTargetResourceResult = @{
                                      Name = $Name; 
                                      Ensure = "Absent";
	}

	Write-Verbose "invoking .... Get-TargetResource";
  
        $getTargetResourceResult;
} 


# The Set-TargetResource function is used to create, delete or configure a chocolatey package on the target machine. 
function Set-TargetResource
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param 
    (       
        [ValidateSet("Present", "Absent")]
        [string]$Ensure = "Present",

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    Write-Verbose "invoking .... Set-TargetResource";
    echo $MyInvocation.MyCommand.Definition > c:\text.txt
    cinst $Name -source http://10.18.8.99/nuget

    Write-Verbose "end invoking .... Set-TargetResource";
} 

function Test-TargetResource
{
    param 
    (       
        [ValidateSet("Present", "Absent")]
        [string]$Ensure = "Present",

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    switch ($Ensure) {
        "Present" {$result = $true}
        "Absent" {$result = $true}
        }

    Write-Verbose "invoking .... Test-TargetResource";
    $false
}