class Gmx < Formula
  desc "GameMaker eXperimental CLI"
  homepage "https://github.com/opera-gaming/homebrew-gmx"
  version "0.3.24"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.3.24/gmx-0.3.24.arm64-macos.tar.gz"
      sha256 "f1c15869af87c29b57e0cd6bb764855b9c19aaf4e2aa845f31e3b611232357f3"
    end
    on_intel do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.3.24/gmx-0.3.24.x86_64-macos.tar.gz"
      sha256 "2754aca9ffe825f6ef879885db61ccf1d5e4707700b9749c84c96760107b62cd"
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
