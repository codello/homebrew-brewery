class LatexRequirement < Requirement
    fatal true
    
    satisfy build_env: false do
        which("mpost")
    end
    
    cask "mactex"
    cask "basictex"
    
    def message; <<~EOS
        LaTeX is required; install it via one of:
          brew cask install mactex
          brew cask install basictex
        EOS
    end
end

class Lilypond < Formula
    desc "... Notensatz für Jedermann"
    homepage "https://lilypond.org"
    
    stable do
        version "2.18.2"
        url "http://lilypond.org/download/sources/v2.18/lilypond-#{version}.tar.gz"
        sha256 "329d733765b0ba7be1878ae3f457dbbb875cc2840d2b75af4afc48c9454fba07"
    end
    
    devel do
        version "2.19.83"
        url "http://lilypond.org/download/sources/v2.19/lilypond-#{version}.tar.gz"
        sha256 "96ba4f4b342d21057ad74d85d647aea7e47a5c24f895127c2b3553a252738fb3"
    end
    
    head "http://git.sv.gnu.org/gitweb/?p=lilypond.git"
    
    
    # depends_on "dejavu fonts"
    depends_on "fontconfig"
    depends_on "freetype"
    depends_on "ghostscript"
    depends_on "sadhen/sadhen/guile@1.8"
    depends_on "pango"
    depends_on "python@2"
    # depends_on International Fonts
    
    depends_on "gcc" => :build
    depends_on "autoconf" => :build
    depends_on "bison" => :build
    depends_on "flex" => :build
    depends_on "fontforge" => :build
    depends_on "gettext" => :build
    # depends_on "make" => :build
    # depends_on "perl" => :build
    depends_on "texinfo" => :build
    depends_on "t1utils" => :build
    # depends_on Cyrillic Fonts
    depends_on LatexRequirement => :build

    depends_on "libtiff" => :build
    depends_on "pkg-config" => :build
    
    fails_with :clang do
        build 1100
        cause "LilyPond uses some GCC specific C++ extensions and must be compiled with GCC"
    end
    
    def install
        # Download Required Fonts
        Dir.mkdir "fonts"
        Dir.chdir('fonts')
        system "curl", "-fsSL", "-o", "cursor.zip", "http://www.gust.org.pl/projects/e-foundry/tex-gyre/cursor/qcr2.004otf.zip"
        system "curl", "-fsSL", "-o", "heros.zip", "http://www.gust.org.pl/projects/e-foundry/tex-gyre/heros/qhv2.004otf.zip"
        system "curl", "-fsSL", "-o", "schola.zip", "http://www.gust.org.pl/projects/e-foundry/tex-gyre/schola/qcs2.005otf.zip"
        system "unzip \\*.zip"
        rm Dir["*.zip"]
        Dir.chdir('..')
        
        working_dir = Dir.pwd
        
        system "./autogen.sh", "--noconfigure"
        Dir.mkdir "build/"
        Dir.chdir('build')
        system "../configure", "--prefix=#{prefix}", "--disable-documentation", "--with-texgyre-dir=#{working_dir}/fonts/"
        system "make", "-j5"
        system "make", "install"
        Dir.chdir('..')
    end
    
    test do
        system "lilypond" "--help"
    end
    
    # TODO: Add optional Target to build documentation
end
