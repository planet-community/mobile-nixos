{ config, lib, pkgs, ... }:

{
  mobile.device.name = "planetcom-cosmocom";
  mobile.device.identity = {
    name = "Cosmo Communicator";
    manufacturer = "Planet Computers";
  };

  mobile.hardware = {
    soc = "mediatek-mt6771";
    ram = 1024 * 6;
    screen = {
      width = 2160;
      height = 1080;
    };
  };

  mobile.boot.stage-1 = { kernel.package = pkgs.callPackage ./kernel { }; };

  mobile.system.android.device_name = "Cosmo Communicator";
  mobile.system.android.bootimg = {
    flash = {
      offset_base = "0x40078000";
      offset_kernel = "0x00008000";
      offset_ramdisk = "0x14f88000";
      offset_second = "0x00e88000";
      offset_tags = "0x13f88000";
      pagesize = "2048";
    };
  };

  boot.kernelParams = [
    "bootopt=64S3,32N2,64N2"
    "buildvariant=user"
    "veritykeyid=id:7e4333f9bba00adfe0ede979e28ed1920492b40f"
    "androidboot.selinux=permissive"
  ];

  mobile.usb.mode = "android_usb";
  # Google
  mobile.usb.idVendor = "18D1";
  # "Nexus 4"
  mobile.usb.idProduct = "D001";

  mobile.system.type = "android";
}
