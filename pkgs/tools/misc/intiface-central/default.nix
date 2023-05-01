{ flutter
, rustc
, cargo
, corrosion
, libdeflate
, lib
, stdenv
, fetchFromGitHub
}:

flutter.mkFlutterApp {
  pname = "intiface-central";
  version = "v2.3.0";
  src = fetchFromGitHub {
    owner = "intiface";
    repo = "intiface-central";
    rev = "v2.3.0";
    hash = "sha256-7RfHGv5vvO/mQOhRDCAa0wEPCiSuBVSMeEEuTj+G+ks=";
  };

  vendorHash = "sha256-QHood10NlaYMLeSLRPWo9RrkskJk5uy8Y+xGRb41/zI=";

  postPatch = ''
    sed -i "s'include(./rust.cmake)'find_package(Corrosion REQUIRED)'" ./linux/CMakeLists.txt
  '';

  buildInputs = [
    rustc
    cargo
    corrosion
    libdeflate
  ];

  meta = with lib; {
    license = licenses.gpl3;
    homepage = "https://buttplug.io";
    description = "Buttplug.io frontend";
    maintainers = [ maintainers.pyrotelekinetic ];
    platforms = platforms.unix;
  };
}
