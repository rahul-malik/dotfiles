{ stdenv, fetchurl, clang, getopt, lua, boost, pkgconfig }:

stdenv.mkDerivation rec {
  name = "highlight-${version}";
  version = "3.35";

  src = fetchurl {
    url = "http://www.andre-simon.de/zip/${name}.tar.bz2";
    sha256 = "8a14b49f5e0c07daa9f40b4ce674baa00bb20061079473a5d386656f6d236d05";
  };

  nativeBuildInputs = [ pkgconfig ];

  patches = [ ./makefile.patch ];
  patchFlags = [ "-p0" ];

  buildInputs = [ clang getopt lua boost ];

  preConfigure = ''
    makeFlags="PREFIX=$out conf_dir=$out/etc/highlight/"
    alias g++=clang
  '';

  meta = with stdenv.lib; {
    description = "Source code highlighting tool";
    homepage = "http://www.andre-simon.de/doku/highlight/en/highlight.php";
    maintainers = maintainers.ndowens;
  };
}
