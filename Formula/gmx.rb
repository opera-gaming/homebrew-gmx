class Gmx < Formula
  desc "GameMaker eXperimental CLI"
  homepage "https://github.com/opera-emoller/homebrew-gmx"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/opera-emoller/homebrew-gmx/releases/download/v0.2.0/gmx-0.2.0.arm64.tar.gz"
      sha256 "af6a381aed76e68cdb73c89f66b9ffa43e326bdf8de02b736fb147ae8b8df5fe"
    end
    on_intel do
      url "https://github.com/opera-emoller/homebrew-gmx/releases/download/v0.2.0/gmx-0.2.0.x86_64.tar.gz"
      sha256 "8135827b4e0fa0688278ecb1660ed594424a98b8e557d3ecce982f8add8b7735"
    end
  end

  def install
    bin.install "gmx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gmx --version")
  end

  def caveats
    <<~EOS
      `gmx run` and `gmx debug` need a GameMaker runtime. The first time
      you use either, gmx downloads the latest runtime into its cache
      (~40s, hundreds of MB) and prints progress as it goes. To do that
      explicitly up front:

          gmx runtime install

      `gmx build`, `import`, `validate`, and `compile` work standalone.
    EOS
  end
end
