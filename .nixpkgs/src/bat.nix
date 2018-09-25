{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name    = "bat-${version}";
  version = "0.7.0";
  src = fetchurl {
    url = "https://github.com/sharkdp/bat/releases/download/v${version}/bat-v${version}-x86_64-apple-darwin.tar.gz";
    sha256 = "0r04g1xf1mjri2mj012ibjimflkgqx0ysgscq24r7ppsvkm098as";
  };
  buildPhase = ''
  cp bat $out/
  '';
}
