param (
    [Int]$projects = 20
)

Invoke-Expression "dotnet new sln --name slngen --output out"

For ($i=0; $i -lt $projects; $i++) {
   $projectName = "project_" + -join ((65..90) + (97..122) | Get-Random -Count 10 | ForEach-Object {[char]$_})
   Invoke-Expression "dotnet new console --name $projectName --output out/$projectName --no-restore"
   Invoke-Expression "dotnet sln out/slngen.sln add out/$projectName/$projectName.csproj"
}
