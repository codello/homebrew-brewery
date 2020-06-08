require_relative "../lib/latex_requirement.rb"
require_relative "../lib/cyrillic_requirement.rb"

class LilypondAT2211 < Formula
  desc "... music notation for everyone"
  homepage "https://lilypond.org"
  url "http://lilypond.org/download/sources/v2.21/lilypond-2.21.1.tar.gz"
  sha256 "b7ccd72488b0838bc1ae5f490d6acefb292a902d977f6ed05f1eb26d30137e5e"
  head "git://git.savannah.gnu.org/lilypond.git"

  option "without-fonts", "Install OpenLilyPond Fonts"

  depends_on "autoconf" => :build
  depends_on "bison" => :build
  depends_on CyrillicRequirement => :build
  depends_on "flex" => :build
  depends_on "fontforge" => :build
  depends_on "gettext" => :build
  depends_on LatexRequirement => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "t1utils" => :build
  depends_on "texinfo" => :build

  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "ghostscript"
  depends_on "pango"
  depends_on "sadhen/sadhen/guile@1.8"

  depends_on "codello/brewery/extractpdfmark" => :recommended

  uses_from_macos "perl" => :build
  uses_from_macos "python"

  resource "TeX Gyre Font Collection" do
    url "http://www.gust.org.pl/projects/e-foundry/tex-gyre/whole/tg2_501otf.zip"
    sha256 "d7f8be5317bec4e644cf16c5abf876abeeb83c43dbec0ccb4eee4516b73b1bbe"
  end

  resource "LilyJAZZ" do
    url "https://github.com/OpenLilyPondFonts/lilyjazz/archive/8fa7d5548ec553eea9b2189a652e089e1eec4209.tar.gz"
    sha256 "e76afcd2d7e61fb80e8cb028632be7c8bf39748781de859329f142e0e40ffb07"
  end

  resource "Profondo" do
    url "https://github.com/OpenLilyPondFonts/profondo/archive/8cfb668d16baaae167e634006b3c621db8f299c6.tar.gz"
    sha256 "c0156f9c785d02fcb8e79b9bcdf8b36ffb7bf427536718d8ffc45319c143aee4"
  end

  resource "Haydn" do
    url "https://github.com/OpenLilyPondFonts/haydn/archive/9e7de8b0a722e650960abaae21c489e554ac02e0.tar.gz"
    sha256 "cabaf4a98fa28e1555dfb042d60a048fa80cabd74bdf5b73d91fb3711931b778"
  end

  resource "Beethoven" do
    url "https://github.com/OpenLilyPondFonts/beethoven/archive/669f400ce0edf7bccd817f10e2015ead78966578.tar.gz"
    sha256 "26dacde1ca4b9004938851e6c65c3d171194e3c3c1a284c3fd0b1da3c751a115"
  end

  resource "Paganini" do
    url "https://github.com/OpenLilyPondFonts/paganini/archive/8e4e55a2c9ae81fe6bc0ce83a5388a9e4c5f7530.tar.gz"
    sha256 "3f3cf86d86d1531878fbd4da1ad3768daf40dd34c5ba01a5039e75d9fe4796b2"
  end

  resource "Improviso" do
    url "https://github.com/OpenLilyPondFonts/improviso/archive/0753f5a102ac6ee59f9660dfe41b5826c93c993e.tar.gz"
    sha256 "9eae14b235c4e95dd85f8064598d10182ff7c05755f8776835e4813d76475e38"
  end

  resource "Bravura" do
    url "https://github.com/OpenLilyPondFonts/bravura/archive/53c774476c2060f379d9ef08569b8412b069b9ff.tar.gz"
    sha256 "b10a49af95a3f6b645685a560b8a97211519c1b6ee42ef79b95f4734373057cb"
  end

  resource "Lily Boulez" do
    url "https://github.com/OpenLilyPondFonts/lilyboulez/archive/e8455fc8401d8f4fd7124d29a55529db19372e02.tar.gz"
    sha256 "b33ccb335256b206681937f80ceb045f96fb19d64345a36bdaa5125eb660c7f4"
  end

  resource "Scorlatti" do
    url "https://github.com/OpenLilyPondFonts/scorlatti/archive/1db87dac9105cd456f5174ba6ca668c94cc553be.tar.gz"
    sha256 "c9540e8d33a3964dfe4ddb3e1c64d86a9c9a51b0cdba3d4774071657045d1d73"
  end

  resource "LV GoldenAge" do
    url "https://github.com/OpenLilyPondFonts/lv-goldenage/archive/8a92fd3ae947dd66cc385452b7093443a84aa072.tar.gz"
    sha256 "337886d84fb21e14a37d659fda0ae7e97f63036be37c498dd0df1a1e57640f5a"
  end

  resource "Gutenberg1939" do
    url "https://github.com/OpenLilyPondFonts/gutenberg1939/archive/2316a350aa58270afadc3b63576dde4e254d4bdf.tar.gz"
    sha256 "e8bccc90470a48f22b810c1b04358e53f9cfe488274c48a6fca97f6863102ffe"
  end

  resource "Gonville" do
    url "https://github.com/OpenLilyPondFonts/gonville/archive/a638bc9d2813ff226bdc70436a137e4d69d8de29.tar.gz"
    sha256 "3bfd398a2c524d21134de1d00aedef78c641472760db83f4a4ac0c17394c3565"
  end

  resource "Ross" do
    url "https://github.com/OpenLilyPondFonts/ross/archive/aa8127fe5668e6069a62d2e8c5f5eb6d028b481c.tar.gz"
    sha256 "1c73257ee4917e12400b0e3c860a9b788e5417577383831e04d7848574cdffba"
  end

  resource "Sebastiano" do
    url "https://github.com/OpenLilyPondFonts/sebastiano/archive/44bf262f20dbb8024bcda38471ddbfb018f01378.tar.gz"
    sha256 "dffb486d03701a68370e521c584c356adf1ef87998178b9567da80dd668e88cd"
  end

  resource "Cadence" do
    url "https://github.com/OpenLilyPondFonts/cadence/archive/1cc0fb7bcdc72f2e6e6e0f38efd813de502b4216.tar.gz"
    sha256 "aa340618687c554a3128767c9bdbcc39df81e42b93ce2f853f1c0fb840ce8eef"
  end

  def install
    font_dir = Pathname("fonts").expand_path
    font_dir.install resource("TeX Gyre Font Collection")

    system "./autogen.sh", "--noconfigure"
    mkdir "build" do
      # The configure step will print some errors as the '@' in the filename
      # confuses SED (using @ as a delimiter). However this probably only an
      # issue when using explicit --infodir=/usr/share (which we don't use).
      system "../configure", \
          # Compilation seems to fail with clang when this flag is not specified.
          "CXXFLAGS=-Wno-c++11-narrowing", \
          "--prefix=#{prefix}", \
          "--disable-documentation", \
          "--with-texgyre-dir=#{font_dir}"
      system "make", "-j#{Etc.nprocessors + 1}"
      # For some reason the previous step generates invalid *.dep files in the
      # mf/out directory (using a single space instead of a tab). Deleting these
      # files seems to solve the problem but there may be unforseen side effects.
      Dir.glob("mf/out/*.dep").each { |file| File.delete(file) }
      system "make", "install"
    end

    if build.with? "fonts"
      fonts_dir = Pathname("#{prefix}/share/lilypond/#{version}/fonts/").expand_path
      ly_dir = Pathname("#{prefix}/share/lilypond/#{version}/ly/").expand_path
      ["LilyJAZZ", "Profondo", "Haydn", "Beethoven", "Paganini", "Improviso", "Bravura",
       "Lily Boulez", "Scorlatti", "LV GoldenAge", "Gutenberg1939", "Gonville", "Ross",
       "Sebastiano", "Cadence"].each do |item|
        resource(item).stage do
          (fonts_dir/"otf").install Dir["otf/*"]
          (fonts_dir/"otf").install Dir["woff/*"]
          (fonts_dir/"svg").install Dir["svg/*"]
          (fonts_dir/"otf").install Dir["supplementary-files/**/*.otf"]
          ly_dir.install Dir["stylesheet/*"]
        end
      end
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
