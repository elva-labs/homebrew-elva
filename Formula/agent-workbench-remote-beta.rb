# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemoteBeta < Formula
  desc "Agent Workbench on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/agent-workbench"
  version "1.0.0-beta.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "e84d147cb551b2e79ec1f36fe8f093e7bca9107a6eb5e93eace9695e316acfc0"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "d16b5013f0190bd8642b30a76b1f64323ee4aa43d9ae765d85548a59329be062"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "1828653fd9a3ef948e499a8f2ddf5927b85ec851771f15915037d23d414ebd47"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "14e2b47717d3d3e40dc34130787ac0c534f24660925a5af010ba40b5aeab2fc1"
    end
  end

  conflicts_with "elva-labs/elva/agent-workbench-remote", because: "both install agent-workbench-remote"

  def install
    binary = Dir["agent-workbench-remote-*"].first
    bin.install binary => "agent-workbench-remote"
    chmod 0755, bin/"agent-workbench-remote"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/agent-workbench-remote version").strip
  end
end
