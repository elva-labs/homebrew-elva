cask "chord@beta" do
  version "1.0.0-beta.11"

  on_arm do
    sha256 "3f261ac3c080027dda62e5e5ce47d195b444a85c4c03b2bacdac1b4c81983465"

    url "https://github.com/elva-labs/chord/releases/download/v#{version}/Chord_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "b74fb67c22cc666e871d0a7e68a1f1b4a099f1ef478edcb33a9be192ad77e899"

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
  binary "#{appdir}/Chord.app/Contents/Resources/bin/chord"
  binary "#{appdir}/Chord.app/Contents/Resources/bin/chord", target: "awb" # the helper's earlier name

  zap trash: [
    "~/Library/Application Support/com.elva-labs.agent-workbench",
    "~/Library/Caches/com.elva-labs.agent-workbench",
    "~/Library/Preferences/com.elva-labs.agent-workbench.plist",
    "~/Library/WebKit/com.elva-labs.agent-workbench",
  ]
end
