class Gmx < Formula
  desc "GameMaker eXperimental CLI"
  homepage "https://github.com/opera-gaming/homebrew-gmx"
  version "0.3.30"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.3.30/gmx-0.3.30.arm64-macos.tar.gz"
      sha256 "501bb0ddc66a5ee2a777d96ce6b90a107e7e7348780a2917d33df322680bed41"
    end
    on_intel do
      url "https://github.com/opera-gaming/homebrew-gmx/releases/download/v0.3.30/gmx-0.3.30.x86_64-macos.tar.gz"
      sha256 "25dba87203e96ff5ddab568b38412814e89198248ebb37ea24d1570a63fbb144"
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
