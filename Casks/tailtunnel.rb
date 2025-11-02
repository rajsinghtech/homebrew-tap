cask "tailtunnel" do
  version "0.0.8"
  sha256 "5c758a17af2f086f3c008ebe21c2baa9df2e8cbd1877d7f71e98c7f3fdec81c7"

  url "https://github.com/rajsinghtech/tailtunnel/releases/download/v#{version}/TailTunnel.zip"
  name "TailTunnel"
  desc "Web dashboard for Tailscale with browser-based SSH and network diagnostics"
  homepage "https://github.com/rajsinghtech/tailtunnel"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "TailTunnel.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/TailTunnel.app"],
                   sudo: false
  end

  zap trash: "~/.tailtunnel"
end
