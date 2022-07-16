{ mobile-nixos, fetchFromGitHub, fetchpatch, ... }:

mobile-nixos.kernel-builder-gcc6 {
  configfile = ./config.aarch64;
  version = "4.4.146";

  src = fetchFromGitHub {
    owner = "planet-community";
    repo = "android_kernel_planet_mt6771";
    rev = "b93a034da925dbab767886f7b42a7dab7fea769d";
    sha256 = "sha256-UsCbazvk7kIAY3FZDYSIexZkJUlDCxeqsLJz+szIn0g=";
  };

  enableRemovingWerror = true;
  isImageGzDtb = true;
  isModular = false;
}
