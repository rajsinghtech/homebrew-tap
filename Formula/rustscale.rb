class Rustscale < Formula
  desc "Rust implementation of Tailscale's client stack"
  homepage "https://github.com/rajsinghtech/rustscale"
  version "0.1.4"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.4/rustscale-universal-apple-darwin.tar.gz"
    sha256 "c0c1e7d47d511eb253278aaf00da2bc03790489231187704398403e5df305c97"
  end

  on_linux do
    on_intel do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.4/rustscale-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55e4fa4d4c210e6588f2b539c5c667972cbec349d61920b2db791d235a62dc93"
    end
    on_arm do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.4/rustscale-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b25d28b8d5e4528bd20974defe76859775297e30772ebe908e2288220134e40"
    end
  end

  def install
    bin.install "rustscale"
    bin.install "rustscaled"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustscale --version")
  end
end
