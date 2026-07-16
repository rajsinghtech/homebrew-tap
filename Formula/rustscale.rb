class Rustscale < Formula
  desc "Rust implementation of Tailscale's client stack"
  homepage "https://github.com/rajsinghtech/rustscale"
  version "0.1.1"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.1/rustscale-universal-apple-darwin.tar.gz"
    sha256 "dc0c1c1bdb1ae0d117559128ce13447f56b0caff00a906c799b1b0d26eb16ec5"
  end

  on_linux do
    on_intel do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.1/rustscale-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "674b0ccd38faeca4ac5210176db47e75c328f8aa6f3ca26ac0ffa081051d2f66"
    end
    on_arm do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.1/rustscale-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d45b32bc561dcd6288d5b3e9352bf5dd2cd09321656a385eb43a79e64a509863"
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
