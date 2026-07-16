class Rustscale < Formula
  desc "Rust implementation of Tailscale's client stack"
  homepage "https://github.com/rajsinghtech/rustscale"
  version "0.1.3"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.3/rustscale-universal-apple-darwin.tar.gz"
    sha256 "4ef3d717bc8fdca81b0b87f856ae780065cbfa59c31a883339e6e904aed738cf"
  end

  on_linux do
    on_intel do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.3/rustscale-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "626e12571e888c9e9a5a4a8ffc1fbba05ddadabfe5f05fe155865e8060db47b7"
    end
    on_arm do
      url "https://github.com/rajsinghtech/rustscale/releases/download/v0.1.3/rustscale-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c64cea335da570e376d0eed0e4fe9b4c82f9167040b286a8fbf04ce8d183ac8a"
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
