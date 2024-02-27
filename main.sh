# Clone Upstream
git clone https://gitlab.freedesktop.org/pipewire/wireplumber -b 0.4.82
cp -rvf ./debian ./wireplumber/
cd ./wireplumber

for i in ../patches/*.patch; do patch -Np1 -i $i ;done
LOGNAME=root dh_make --createorig -y -l -p wireplumber_0.4.82

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
