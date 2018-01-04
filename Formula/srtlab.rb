class Srtlab < Formula
    desc "SubRip subtitle file converter"
    homepage "https://www.dr-lex.be/software/srtlab.html"
    url "https://github.com/DrLex0/SRTLab/releases/download/0.97/srtlab.pl"
    sha256 "6d3f49c310a9b08c4a7c8fdb59c898286a3b70b481f78ef4e947af6948eee08a"

    def install
        mv "srtlab.pl", "srtlab"
        bin.install "srtlab"
    end

    test do
        (testpath/"test.srt").write <<~EOS
            1
            00:00:10,000 --> 00:00:13,000
            éâ blårg

            2
            00:00:27,183 --> 00:00:31,416
            ¡Dit is bról!
            Bröl brøl
        EOS
        system "#{bin}/srtlab", "-w", "-u", "-e", "test.srt"
    end
end
