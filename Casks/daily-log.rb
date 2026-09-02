#
# The app is Developer ID signed and notarized, so it installs like any other
# cask — no `--no-quarantine`, no Gatekeeper prompt:
#
#     brew tap elva-labs/elva
#     brew install --cask daily-log

cask "daily-log" do
  version "1.0.3"
  sha256 "a96707541150b164139615a15a826b7dda6866b7cca20ae573939b7da0b64d38"

  url "https://github.com/elva-labs/daily_log/releases/download/v#{version}/daily_log-#{version}.zip"
  name "daily_log"
  desc "Menu-bar agent that nudges you to log what you are doing"
  homepage "https://github.com/elva-labs/daily_log"

  livecheck do
    url :url
    strategy :github_latest
  end

  # A bare symbol means "this version or newer". The `">= :tahoe"` string form
  # is deprecated.
  depends_on macos: :tahoe

  app "daily_log.app"

  # Launch-at-login is an SMAppService registration owned by the app itself, so
  # unregister it before the bundle disappears.
  uninstall launchctl: "se.axtelius.daily-log",
            quit:      "se.axtelius.daily-log"

  zap trash: [
    "~/Library/Application Support/daily",
    "~/Library/Preferences/se.axtelius.daily-log.plist",
  ]
end
