cask "claude-stats" do
  version "0.1.2"
  sha256 "af3c6cebcbe4b2578819606113846f83967442282a1d8bc6ad3c70fdf93562db"

  url "https://github.com/elva-labs/claude-stats/releases/download/v#{version}/Claude-Stats.zip"
  name "Claude Stats"
  desc "Claude and OpenAI usage quotas in the menu bar"
  homepage "https://github.com/elva-labs/claude-stats"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Claude Stats.app"

  zap trash: [
    "~/Library/Application Support/ClaudeStats",
    "~/Library/Logs/ClaudeStats.log",
    "~/Library/Preferences/com.elva-labs.claude-stats.plist",
  ]
end
