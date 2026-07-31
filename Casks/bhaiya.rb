cask "bhaiya" do
  version "0.1.3"
  sha256 "09c58e1907d131d9c6c0947eb5be0be775adbb9ec9f775e11771b352657cee8d"

  url "https://github.com/rajsinghtech/homebrew-tap/releases/download/bhaiya-v#{version}/Bhaiya-#{version}-macOS.zip"
  name "Bhaiya Client"
  desc "Native macOS client for Bhaiya workstations"
  homepage "https://github.com/rajsinghtech/homebrew-tap"

  livecheck do
    url "https://api.github.com/repos/rajsinghtech/homebrew-tap/releases"
    regex(/^bhaiya-v?(\d+(?:\.\d+)+)$/i)
    strategy :json do |json, regex|
      json.map { |release| release["tag_name"]&.match(regex)&.captures&.first }
    end
  end

  app "Bhaiya Client.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Bhaiya Client.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/top.keiretsu.bhaiya.client",
    "~/Library/Caches/top.keiretsu.bhaiya.client",
    "~/Library/Preferences/top.keiretsu.bhaiya.client.plist",
  ]
end
