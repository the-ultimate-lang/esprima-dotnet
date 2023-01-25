#! busybox bash
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`
version="${ts}"
sed -i -e "s/<AssemblyName>.*<\/AssemblyName>/<AssemblyName>Ultimate.Language.Esprima<\/AssemblyName>/g" Esprima.csproj
sed -i -e "s/<PackageId>.*<\/PackageId>/<PackageId>Ultimate.Language.Esprima<\/PackageId>/g" Esprima.csproj
sed -i -e "s/<Version>.*<\/Version>/<Version>${version}<\/Version>/g" Esprima.csproj
rm -rf obj bin
dotnet pack -p:Configuration=Release -p:Platform=AnyCPU
rm -rf *.nupkg
cp -rpv bin/Release/*.nupkg .
