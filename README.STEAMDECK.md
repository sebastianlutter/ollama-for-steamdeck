# Install guide for steam deck

## Use the prebuild docker image
```
docker run -e OLLAMA_DEBUG=1 --rm --device /dev/kfd --device /dev/dri -v $(pwd)/ollama:/root/.ollama -p 11434:11434 --name ollama sebastianlutter/ollama-for-steamdeck:0.6.3-gfx1033-rocm6.3.3
```

* Get a shell in the running docker
```
docker exec -it $(docker ps --format "{{.ID}}" --filter "name=ollama") bash
```

## Build the docker on your steamdeck
* Steam OS 3.6.22
```
(deck@steamdeck ~)$ cat /etc/*release*
DISTRIB_ID="SteamOS"
DISTRIB_RELEASE="rolling"
DISTRIB_CODENAME="Holo"
DISTRIB_DESCRIPTION="SteamOS Holo"
NAME="SteamOS"
PRETTY_NAME="SteamOS"
VERSION_CODENAME=holo
ID=steamos
ID_LIKE=arch
ANSI_COLOR="1;35"
HOME_URL="https://www.steampowered.com/"
DOCUMENTATION_URL="https://support.steampowered.com/"
SUPPORT_URL="https://support.steampowered.com/"
BUG_REPORT_URL="https://support.steampowered.com/"
LOGO=steamos
VARIANT_ID=steamdeck
VERSION_ID=3.6.22
BUILD_ID=20250224.1
STEAMOS_DEFAULT_UPDATE_BRANCH=stable
```

* Clone repo
```
git clone git@github.com:sebastianlutter/ollama-for-steamdeck.git
```

* Make sure docker-buildx is installed on your Steam OS, [follow these steps]((https://neveriand.github.io/articles/new/new-02-install-docker-on-a-steam-deck.html)

* Identify your gfx version
```
(1)(deck@steamdeck ~)$ /opt/rocm/bin/rocminfo | grep gfx
  Name:                    gfx1033                            
      Name:                    amdgcn-amd-amdhsa--gfx1033
```

* Set the gfx version for `AMDGPU_TARGETS` in `CMakePresets.json` and `CMakeLists.txt` [from this guide](https://github.com/likelovewant/ollama-for-amd/wiki)

* Build the docker for steamdeck
```
cd ollama-for-amd
./scripts/build_docker.sh
```
