class Gmx < Formula
  desc "GameMaker eXperimental CLI"
  homepage "https://github.com/opera-emoller/homebrew-gmx"
  version "0.1.2"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/opera-emoller/homebrew-gmx/releases/download/v0.1.2/gmx-0.1.2.arm64.tar.gz"
      sha256 "cacc50f9bc5cfbe4346f7bcb43c453b09a8d5cd2c028a607c9df295acf7def98"
    end
    on_intel do
      url "https://github.com/opera-emoller/homebrew-gmx/releases/download/v0.1.2/gmx-0.1.2.x86_64.tar.gz"
      sha256 "b9af3bdd2270b988171a0d0eaf57b0b40874b991610110ecc3bdd80e912788f9"
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
