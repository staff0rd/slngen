param (
    [Int]$projects = 20,
    [string]$output = "out"
)

Invoke-Expression "dotnet new sln --name slngen --output $output"

For ($i=0; $i -lt $projects; $i++) {
   $projectName = "project_" + -join ((65..90) + (97..122) | Get-Random -Count 10 | ForEach-Object {[char]$_})
   Invoke-Expression "dotnet new console --name $projectName --output $output/$projectName --no-restore"
   Invoke-Expression "dotnet sln $output/slngen.sln add $output/$projectName/$projectName.csproj"
}
