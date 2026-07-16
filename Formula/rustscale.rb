class Rustscale < Formula
  desc "Rust implementation of Tailscale's client stack"
  homepage "https://github.com/rajsinghtech/rustscale"
  version "0.1.2"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.2/rustscale-universal-apple-darwin.tar.gz"
    sha256 "343c3c45b1cf1e50095e8a917198f118b58dc92901b1a502bf4d309853d2f47e"
  end

  on_linux do
    on_intel do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.2/rustscale-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "081cc5ce40cf5a5329409c2b4a1a9f910604e10d9b63c4f9749477f93a5326a5"
    end
    on_arm do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.2/rustscale-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b2ac8d84e6fa59d1bf95bc7a057de596c15fe2d22ac1b9b7c1c6d7632d83980"
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
