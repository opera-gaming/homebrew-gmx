class Gmx < Formula
  desc "GameMaker eXperimental CLI"
  homepage "https://github.com/opera-gaming/homebrew-gmx"
  version "0.4.6"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.4.6/gmx-0.4.6.arm64-macos.tar.gz"
      sha256 "2d1ba0e388944b19552cc47b08ddd5468136cadfe780fd6a5a009f1a4a795185"
    end
    on_intel do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.4.6/gmx-0.4.6.x86_64-macos.tar.gz"
      sha256 "72593b00c25f464b808d583f526a0a9b15f38240b72a865ac20223ca5b54080b"
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
