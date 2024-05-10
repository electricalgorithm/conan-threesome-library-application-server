FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 python3-dev python3-venv python3-wheel python3-setuptools python3-pip
RUN apt-get install -y python3-pip lsb-release wget software-properties-common gnupg build-essential clang libclang-dev cmake
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh all
RUN rm -rf llvm.sh
RUN python3 -m pip install conan==1.64
