cask "chord@beta" do
  version "1.0.0-beta.6"

  on_arm do
    sha256 "f5ae585aabe3815c9fb48fc3a4f80e8add875815aa62f19c77befe7044ee97f2"

    url "https://github.com/elva-labs/chord/releases/download/v#{version}/Chord_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "3b4e7cb1767cf8ba33b3aae3f8daeca273175c9d0378ddd6a31565a48d678779"

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
