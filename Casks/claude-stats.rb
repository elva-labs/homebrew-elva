cask "claude-stats" do
  version "0.2.0"
  sha256 "3df19fe455c560cc814ad527c33f8681008d5ae893506c8d7e2974e106752f04"

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
