cask "agent-workbench" do
  version "0.5.3"

  on_arm do
    sha256 "f1a2cace56651b9a8b24c9e0775c3ad3bf76b4efafa7643bcfbbd2b5c6461f00"

    url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/Agent.Workbench_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "8df1d5988b7a26a7ddaa176e54b6b61565f3ef156cc765011099afc5d77dc386"

    url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/Agent.Workbench_#{version}_x64.dmg"
  end

  name "Agent Workbench"
  desc "Desktop for terminal coding agents: sessions, live changes, remote projects"
  homepage "https://github.com/elva-labs/agent-workbench"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Agent Workbench.app"
  binary "#{appdir}/Agent Workbench.app/Contents/Resources/bin/awb"

  zap trash: [
    "~/Library/Application Support/com.elva-labs.agent-workbench",
    "~/Library/Caches/com.elva-labs.agent-workbench",
    "~/Library/Preferences/com.elva-labs.agent-workbench.plist",
    "~/Library/WebKit/com.elva-labs.agent-workbench",
  ]
end
