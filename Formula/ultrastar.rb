class Ultrastar < Formula
  desc "The free and open source karaoke singing game"
  homepage "https://usdx.eu"
  url "https://github.com/UltraStar-Deluxe/USDX/archive/v2017.8.0.tar.gz"
  sha256 "215fb349dde829383bb257aae4abda21b4f531a615b6112544fe1a593c3d47f0"

  head "https://github.com/UltraStar-Deluxe/USDX.git"

  depends_on "automake" => :build
  depends_on "binutils" => :build
  depends_on "ffmpeg@2.8" => :build
  depends_on "fpc" => :build
  depends_on "freetype" => :build
  depends_on "libtiff" => :build
  depends_on "lua" => :build
  depends_on "pkg-config" => :build
  depends_on "portaudio" => :build
  depends_on "sdl2" => :build
  depends_on "sdl2_image" => :build
  depends_on "sqlite" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug", "--prefix=#{prefix}"
    system "make", "macosx-standalone-app"

    prefix.install "UltraStarDeluxe.app"
  end
end
