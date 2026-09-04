class Gmx < Formula
  desc "GameMaker eXperimental CLI"
  homepage "https://github.com/opera-gaming/homebrew-gmx"
  version "0.4.8"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.4.8/gmx-0.4.8.arm64-macos.tar.gz"
      sha256 "9ea39747d2ebce3cd4530da987528e1dd7daf70a0f881c7ddfeb2e5278b92fbe"
    end
    on_intel do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.4.8/gmx-0.4.8.x86_64-macos.tar.gz"
      sha256 "a4ad0317660999e586c362e07e24e14b0f31dae2192dbcb6cb205a961bcf450d"
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
