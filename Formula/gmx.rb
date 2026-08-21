class Gmx < Formula
  desc "GameMaker eXperimental CLI"
  homepage "https://github.com/opera-gaming/homebrew-gmx"
  version "0.3.35"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.3.35/gmx-0.3.35.arm64-macos.tar.gz"
      sha256 "131574ce87ca00ebb3da6ff6082dda5681996245047c6594da162d4cfee3d75b"
    end
    on_intel do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.3.35/gmx-0.3.35.x86_64-macos.tar.gz"
      sha256 "8d97456712f22afce08bfe1a6e7aefbf76bd1d5595bffbeca5d88d5264c4409a"
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
