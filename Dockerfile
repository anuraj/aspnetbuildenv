FROM microsoft/aspnet
LABEL Author="Anuraj"
LABEL Version="1.0"
LABEL description="This image can be used for building Angular ASP.NET MVC projects."
SHELL ["powershell"]

ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\\Downloads\\vs_buildtools.exe
ADD https://dist.nuget.org/win-x86-commandline/v4.3.0/nuget.exe C:\\Nuget\\nuget.exe
ADD https://nodejs.org/dist/v8.10.0/node-v8.10.0-win-x64.zip C:\\Downloads\\node-v8.10.0-win-x64.zip

RUN "Expand-Archive" "-LiteralPath C:\\Downloads\\node-v8.10.0-win-x64.zip" "-DestinationPath C:\\NodeJs\\"

RUN C:\\Downloads\\vs_buildtools.exe --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.WebBuildTools --quiet --wait

RUN "[Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Tools\;C:\NodeJs\node-v8.10.0-win-x64;C:\Nuget;C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin', [EnvironmentVariableTarget]::Machine)"