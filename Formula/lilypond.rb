class LatexRequirement < Requirement
  fatal true

  satisfy :build_env => false do
    metafont = which("mf-nowin") || which("mf") || which("mfw") || which("mfont")
    metapost = which("mpost") || which("metapost")
    kpsewhich = which("kpsewhich")
    metafont && metapost && kpsewhich
  end

  def message; <<~EOS
    A working LaTeX installation is required for building LilyPond. Install it via one of:
      brew cask install mactex
      brew cask install basictex
  EOS
  end
end

class CyrillicRequirement < Requirement
  fatal false

  satisfy :build_env => false do
    kpsewhich = which("kpsewhich")
    system kpsewhich, "lcy.sty", :out => File::NULL if kpsewhich
  end

  def message; <<~EOS
    The LaTeX 'cyrillic' package should be installed before building LilyPond. Install it via:
      tlmgr install cyrillic
    The installation may still work without this dependency.
  EOS
  end
end

class Lilypond < Formula
  desc "... music notation for everyone"
  homepage "https://lilypond.org"

  head "git://git.savannah.gnu.org/lilypond.git"

  stable do
    url "http://lilypond.org/download/sources/v2.20/lilypond-2.20.0.tar.gz"
    sha256 "595901323fbc88d3039ca4bdbc2d8c5ce46b182edcb3ea9c0940eba849bba661"
  end

  devel do
    url "http://lilypond.org/download/sources/v2.19/lilypond-2.19.84.tar.gz"
    sha256 "94dcc66447f24966f28eda72c79e1ec16143b8ea4a537cc9f97d017cc0c0dd11"
  end

  depends_on "autoconf" => :build
  depends_on "bison" => :build
  depends_on CyrillicRequirement => :build
  depends_on "flex" => :build
  depends_on "fontforge" => :build
  depends_on "gettext" => :build
  depends_on LatexRequirement => :build
  uses_from_macos "make" => :build
  uses_from_macos "perl" => :build
  depends_on "pkg-config" => :build
  depends_on "t1utils" => :build
  depends_on "texinfo" => :build

  uses_from_macos "python"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "ghostscript"
  depends_on "pango"
  depends_on "sadhen/sadhen/guile@1.8"

  depends_on "codello/brewery/extractpdfmark" => :recommended

  resource "TeX Gyre Font Collection" do
    url "http://www.gust.org.pl/projects/e-foundry/tex-gyre/whole/tg2_501otf.zip"
    sha256 "d7f8be5317bec4e644cf16c5abf876abeeb83c43dbec0ccb4eee4516b73b1bbe"
  end

  def install
    font_dir = Pathname("fonts").expand_path
    font_dir.install resource("TeX Gyre Font Collection")

    system "./autogen.sh", "--noconfigure"
    mkdir "build" do
      system "../configure", \
          "--prefix=#{prefix}", \
          "--disable-documentation", \
          "--with-texgyre-dir=#{font_dir}"
      system "make", "-j#{Etc.nprocessors + 1}"
      system "make", "install"
    end
  end

  test do
    File.write("test.ly", <<~EOS
      \\version "#{version}"

      \\relative c' {
        \\clef treble \\key c \\major \\time 4/4
        c d e f |
        g a b c |
        \\bar "|."
      }
    EOS
    )
    system "lilypond", "test.ly"
  end
end
