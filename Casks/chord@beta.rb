cask "chord@beta" do
  version "1.0.0-beta.8"

  on_arm do
    sha256 "8fab0928ca785f68ed74fc1c650d1159a4bce1a6d78d34d3b0d5b64dfc614939"

    url "https://github.com/elva-labs/chord/releases/download/v#{version}/Chord_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "df8fc72f9b12eb2f9297ff949493fb46c9fe2f7c512615362643372bf4bd57a6"

    url "https://github.com/elva-labs/chord/releases/download/v#{version}/Chord_#{version}_x64.dmg"
  end

  name "Chord"
  desc "Desktop for terminal coding agents: sessions, live changes, remote projects"
  homepage "https://github.com/elva-labs/chord"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-[0-9a-z.]+)?)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  conflicts_with cask: ["chord", "agent-workbench"]
  depends_on macos: :ventura

  app "Chord.app"
  binary "#{appdir}/Chord.app/Contents/Resources/bin/awb"

  zap trash: [
    "~/Library/Application Support/com.elva-labs.agent-workbench",
    "~/Library/Caches/com.elva-labs.agent-workbench",
    "~/Library/Preferences/com.elva-labs.agent-workbench.plist",
    "~/Library/WebKit/com.elva-labs.agent-workbench",
  ]
end
