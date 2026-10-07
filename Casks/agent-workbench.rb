cask "agent-workbench" do
  version "0.6.1"

  on_arm do
    sha256 "f8b9a5240909ee9a4503633fb8820c8d706944d6d2a83b11c7e9dfc7e1340598"

    url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/Agent.Workbench_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "71fb3581c829c2b8e8644b4602f0f391df18990d8bc569b86135c2a3aa04488a"

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
