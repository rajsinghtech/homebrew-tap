cask "tailtunnel" do
  version "0.0.6"
  sha256 "134c68c3db2a355a5ccf6578edbbde98a4f7720babdfcea6bd6beca197d72cc1"

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
