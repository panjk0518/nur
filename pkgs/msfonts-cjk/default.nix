{ stdenv, gnutar, zstd, fetchurl }:

stdenv.mkDerivation {
  pname = "msfonts-cjk";
  version = "1.000";
  description = "Microsoft CJK Fonts that I use and Segoe UI Fonts extracted from Windows 11";

  src = fetchurl {
    url = "https://raw.githubusercontents.com/panjk0518/nur/refs/heads/main/pkgs/msfonts-cjk/assets/msfonts-cjk.tar.zst";
    hash = "sha256-lGKIggBO01QdJ0cmseapGvktMFfngR8CxgltFewb1VE=";
  };

  nativeBuildInputs = [
    gnutar
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
