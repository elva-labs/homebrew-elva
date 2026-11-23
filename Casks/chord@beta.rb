cask "chord@beta" do
  version "1.0.0-beta.9"

  on_arm do
    sha256 "a21b461a7a9f033b4c5618144a28ff120530d10cdd5b6a0c29f57a0000e933bd"

    url "https://github.com/elva-labs/chord/releases/download/v#{version}/Chord_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "ddc667beada03e1b52b4c3b2dc44237df9567ac7ac721c4de3d5e0cc3e94ea68"

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
