cask "spurfire" do
  version "0.1.3"
  sha256 "4260d18e2318e8cdb4fcde384b6eb844fc9fd7a9191b8438f03c048fd7e90e5f"

  url "https://github.com/rajsinghtech/spurfire/releases/download/v#{version}/Spurfire-macos-universal.zip"
  name "Spurfire"
  desc "Peer-hosted horseback shooter powered by RustScale"
  homepage "https://github.com/rajsinghtech/spurfire"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Spurfire.app"

  # Temporary until the public app is Developer ID signed and notarized.
  # The release archive is integrity-pinned above before quarantine is cleared.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Spurfire.app"],
                   sudo: false
  end

  zap trash: "~/Library/Application Support/Godot/app_userdata/Spurfire"
end
