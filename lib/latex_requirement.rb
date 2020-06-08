# The `LatexRequirement` ensures that Latex is installed. More specifically it
# ensures the presence of appropriate binaries for metafont, metapost and
# kpwsewhich.
#
# This requirement is used for the lilypond formula.
class LatexRequirement < Requirement
  fatal true

  satisfy :build_env => false do
    metafont = which("mf-nowin") || which("mf") || which("mfw") || which("mfont")
    metapost = which("mpost") || which("metapost")
    kpsewhich = which("kpsewhich")
    metafont && metapost && kpsewhich
  end

  def message
    <<~EOS
      A working LaTeX installation is required for building LilyPond. Install it via one of:
        brew cask install mactex
        brew cask install basictex
    EOS
  end
end
