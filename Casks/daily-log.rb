cask "daily-log" do
  version "1.0.2"
  sha256 "aa6d4d784307317f2eb1d8310e2a5d5ea8fd2f31634fa4175b651f981907651b"

  url "https://github.com/elva-labs/daily_log/releases/download/v#{version}/daily_log-#{version}.zip"
  name "daily_log"
  desc "Menu-bar agent that nudges you to log what you are doing"
  homepage "https://github.com/elva-labs/daily_log"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "daily_log.app"

  uninstall launchctl: "se.axtelius.daily-log",
            quit:      "se.axtelius.daily-log"

  zap trash: [
    "~/Library/Application Support/daily",
    "~/Library/Preferences/se.axtelius.daily-log.plist",
  ]
end
