class Srtlab < Formula
    version "0.98"
    desc "SubRip subtitle file converter"
    homepage "https://www.dr-lex.be/software/srtlab.html"
    url "https://github.com/DrLex0/SRTLab/releases/download/0.98/srtlab.pl"
    sha256 "356ef5a4a826e23b2e554789c96ee8452093ed0de13f049656f2b5c8039f51d9"

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
