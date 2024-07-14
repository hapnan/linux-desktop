#!/bin/false

# For CUDA specific logic

build_nvidia_main() {
    printf "/usr/local/nvidia/lib\n" >> /etc/ld.so.conf.d/nvidia.conf
    printf "/usr/local/nvidia/lib64\n" >> /etc/ld.so.conf.d/nvidia.conf
    # Configure OpenCL manually
    mkdir -pm755 /etc/OpenCL/vendors
    printf "libnvidia-opencl.so.1\n" > /etc/OpenCL/vendors/nvidia.icd
    # Configure Vulkan manually
    VULKAN_API_VERSION=$(dpkg -s libvulkan1 | grep -oP 'Version: [0-9|\.]+' | grep -oP '[0-9]+(\.[0-9]+)(\.[0-9]+)')
    mkdir -pm755 /etc/vulkan/icd.d/ 
    cp /opt/ai-dock/share/vulkan/icd.d/nvidia_icd.json /etc/vulkan/icd.d/
    sed -i "s/\$VULKAN_API_VERSION/$VULKAN_API_VERSION/g" /etc/vulkan/icd.d/nvidia_icd.json
    
    # Extract NVRTC dependency, https://developer.download.nvidia.com/compute/cuda/redist/cuda_nvrtc/LICENSE.txt
    cd /tmp
    curl -fsSL -o cuda_nvrtc-linux-x86_64-12.5.82-archive.tar.xz "https://developer.download.nvidia.com/compute/cuda/redist/cuda_nvrtc/linux-x86_64/cuda_nvrtc-linux-x86_64-12.5.82-archive.tar.xz"
    tar -xJf cuda_nvrtc-linux-x86_64-12.5.82-archive.tar.xz
    cd cuda_nvrtc-linux-x86_64-12.5.82-archive/nvrtclib
    chmod 755 libnvrtc*
    find . -maxdepth 1 -type f -name "*libnvrtc.so.*" -exec sh -c 'ln -snf $(basename {}) libnvrtc.so' \;
    mv -f libnvrtc* /opt/gstreamer/lib/x86_64-linux-gnu/
}

build_nvidia_main "$@"