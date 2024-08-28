# Usa la imagen base de .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Establece el directorio de trabajo en el contenedor
WORKDIR /src

# Copia el archivo Program.cs desde la máquina local al contenedor
COPY . .

# Cambia al directorio de la aplicación
RUN dotnet restore "blazor1.csproj"

RUN dotnet build "blazor1.csproj" -c Release -o /app/build

RUN dotnet publish "blazor1.csproj" -c Release -o /app/public

# Usa una imagen más ligera para el runtime (opcional pero recomendado para producción)
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Establece el directorio de trabajo en el contenedor final
WORKDIR /app

# Copia los archivos publicados desde la etapa de construcción
COPY --from=build /app/public .

# Define el comando para ejecutar la aplicación
ENTRYPOINT ["dotnet", "blazor1.dll", "--urls", "http://0.0.0.0:5000"]

