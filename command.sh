#dirBuildSource=~/ubuntu/src

dirBuildSource=./

printf "%s\n%s\n%s\n%s\n%s\n%s\n" \
"${dirBuildSource}/2020.0/" \
"${dirBuildSource}/build-host/" \
"${dirBuildSource}/build-target/" \
"${dirBuildSource}/libraries.tools/" \
"${dirBuildSource}/libraries.docs/" \
"${dirBuildSource}/libraries.infrastructure/"


#chmod -R 777 ${dirBuildSource}/build* ${dirBuildSource}/libraries*
#chmod -R 755 ${dirBuildSource}/2020.0
mkdir ~/build

dirBuildRoot=~/build
dockerImage=hub.docker.com/repository/docker
echo "Using ${dockerImage} as source of Docker build container."
dockerCommand="docker run -it -v ${dirBuildSource}:${dirBuildRoot}:z ${dockerImage}"
echo "${dockerCommand}"
#eval "${dockerCommand}"



# ############################################################################


set -ex
rm -rf ${dirBuildRoot}/build* # remove folder with contents
mkdir ${dirBuildRoot}/build # make directory with name
mkdir ${dirBuildRoot}/libraries.tools # make libraries.tools directory
cd ${dirBuildRoot}/build # change directory that name
ls -al
# cmake -DBUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${dirBuildRoot}/build/host -DHOST_STRUCTURE=ON -DPACKAGE_TYPE=PUBLIC ${dirBuildRoot}/libraries.tools

cmake -DBUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX= . -DHOST_STRUCTURE=ON -DPACKAGE_TYPE=PUBLIC .

make VERBOSE=1 -j$(nproc) 2>&1 | tee <build-root>/build/build_log.txt
make VERBOSE=1 # 2>&1 | tee ${dirBuildRoot}/build/build_log.txt
make doc # -j$(nproc)
make install # -j$(nproc)


cd ..
mv ${dirBuildRoot}/build ${dirBuildRoot}/build-host
