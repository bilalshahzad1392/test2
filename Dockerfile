#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.


FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster

EXPOSE 80
EXPOSE 443

WORKDIR /app

COPY . /app/src

WORKDIR /app/src

# RUN ls
RUN dotnet restore WebApplication1.csproj

RUN dotnet build "WebApplication1.csproj" -c Release -o /app/build

RUN dotnet publish "WebApplication1.csproj" -c Release -o /app/publish

WORKDIR /app/publish

ENTRYPOINT ["dotnet", "WebApplication1.dll","--urls", "http://0.0.0.0:80;https://0.0.0.0:443"]