cask "tailtunnel" do
  version "0.1.2"
  sha256 "966a239077de75ecef8bbfdf551a6e4a15e240fda22ca1e17bdc96a6ee0ddb76"

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
