# frozen_string_literal: true

# The `CyrillicRequirement` checks for the presence of the latex `cyrillic`
# package. If it is not present, a warning will be issued. This requirement is
# intended to be used with the lilypond formula.
class CyrillicRequirement < Requirement
  fatal false

  satisfy :build_env => false do
    kpsewhich = which("kpsewhich")
    system kpsewhich, "lcy.sty", out: File::NULL if kpsewhich
  end

  def message
    <<~EOS
      The LaTeX 'cyrillic' package should be installed before building LilyPond. Install it via:
        tlmgr install cyrillic
      The installation may still work without this dependency.
    EOS
  end
end
