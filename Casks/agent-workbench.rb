cask "agent-workbench" do
  version "0.1.2"

  on_arm do
    sha256 "323eede7d980ff9ffa5a0c904c762fc1dded4fb270b0ee5acf5ecc242f39ff5c"

    url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/Agent.Workbench_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "98096eb1eafa1d4134d23149855468ce40609c22cd4cb87b7ca3b771967660f7"

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

  zap trash: [
    "~/Library/Application Support/com.elva-labs.agent-workbench",
    "~/Library/Caches/com.elva-labs.agent-workbench",
    "~/Library/Preferences/com.elva-labs.agent-workbench.plist",
    "~/Library/WebKit/com.elva-labs.agent-workbench",
  ]
end
