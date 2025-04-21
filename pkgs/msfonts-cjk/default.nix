{ stdenv, tar, zstd }:

stdenv.mkDerivation {
  pname = "berkeley-mono-typeface";
  version = "1.000";
  description = "Microsoft CJK Fonts that I use and Segoe UI Fonts extracted from Windows 11";

  src = ./assets/msfonts-cjk.tar.zst;

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
