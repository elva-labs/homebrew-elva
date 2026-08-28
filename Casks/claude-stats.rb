cask "claude-stats" do
  version "0.1.3"
  sha256 "f4654a84fe5c3a7940d2020dc44a68b7592876bd87cbd466020a1ec639953e09"

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
