# Common environment setup across build*.sh scripts

export VERSION=0.6.3-gfx1033-rocm6.3.3
export GOFLAGS="'-ldflags=-w -s \"-X=github.com/ollama/ollama/version.Version=$VERSION\" \"-X=github.com/ollama/ollama/server.mode=release\"'"
# TODO - consider `docker buildx ls --format=json` to autodiscover platform capability
PLATFORM=${PLATFORM:-"linux/amd64"}
#PLATFORM=${PLATFORM:-"linux/arm64,linux/amd64"}
DOCKER_ORG=${DOCKER_ORG:-"ollama"}
FINAL_IMAGE_REPO=sebastianlutter/ollama-for-steamdeck
OLLAMA_COMMON_BUILD_ARGS="--build-arg=VERSION \
    --build-arg=GOFLAGS \
    --build-arg=OLLAMA_CUSTOM_CPU_DEFS \
    --build-arg=OLLAMA_SKIP_CUDA_GENERATE \
    --build-arg=OLLAMA_SKIP_CUDA_11_GENERATE \
    --build-arg=OLLAMA_SKIP_CUDA_12_GENERATE \
    --build-arg=OLLAMA_SKIP_ROCM_GENERATE \
    --build-arg=OLLAMA_FAST_BUILD \
    --build-arg=CUSTOM_CPU_FLAGS \
    --build-arg=GPU_RUNNER_CPU_FLAGS \
    --build-arg=AMDGPU_TARGETS"

echo "Building Ollama"
echo "VERSION=$VERSION"
echo "PLATFORM=$PLATFORM"
