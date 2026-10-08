cask "agent-workbench" do
  version "0.7.0"

  on_arm do
    sha256 "41115ea11e97642dc374fe4f59c5f576d2609ddde55f2641664722b7ad4bf667"

    url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/Agent.Workbench_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "453d3d22e123d9192246a879e48cb3ab55cf1c302bda26ac6d40be87061c3498"

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
