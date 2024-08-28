FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

COPY . .

RUN dotnet restore "blazor1.csproj"

RUN dotnet build "blazor1.csproj" -c Release -o /app/build

RUN dotnet publish "blazor1.csproj" -c Release -o /app/public

FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app

COPY --from=build /app/public .

ENTRYPOINT ["dotnet", "blazor1.dll", "--urls", "http://0.0.0.0:5000"]

