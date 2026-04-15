{ pkgs, ... }:

{

  environment.sessionVariables = {
    CCACHE_DIR = "$HOME/dev/ccache";
  };

  environment.systemPackages = with pkgs; [
    # toolchain
    clang
    llvm
    lld
    libllvm

    # build tools
    cmake
    ninja
    gnumake
    pkg-config

    # debugger / profiler
    gdb
    lldb

    # clang toolchain utilities
    clang-tools
    clang-analyzer

    # performance / caching
    ccache
  ];
}
