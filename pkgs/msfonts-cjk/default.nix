{ stdenv, tar, zstd, fetchUrl }:

stdenv.mkDerivation {
  pname = "berkeley-mono-typeface";
  version = "1.000";
  description = "Microsoft CJK Fonts that I use and Segoe UI Fonts extracted from Windows 11";

  src = fetchUrl {
    url = "https://raw.githubusercontents.com/panjk0518/nur/refs/heads/main/pkgs/msfonts-cjk/assets/msfonts-cjk.tar.zst";
    hash = "sha512-8848c79895e103c2d5f0f4ffd17e8069e8f1c3d81c1ea454223f0921587d472d9ab6f0c13200ae688e974b97a49fc773596965cc950b55cf7aeedc8300a1c038";
  };

  nativeBuildInputs = [
    tar
    zstd
  ];

  unpackPhase = ''
    runHook preUnpack

    tar xvf $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 msfonts-cjk/* -t $out/share/fonts/msfonts-cjk

    runHook postInstall
  '';
}
