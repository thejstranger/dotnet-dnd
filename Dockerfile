FROM microsoft/dotnet:sdk as core_build

WORKDIR '/app'

# Copy csporj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

#Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime

WORKDIR '/app'

COPY --from=core_build /app/out .
ENTRYPOINT ["dotnet","dotnet-webapi.dll"]
