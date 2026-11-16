# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemoteBeta < Formula
  desc "Agent Workbench on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/agent-workbench"
  version "1.0.0-beta.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "7fdc98e747730a492080468c091908f981e7b710f1c4c2f7d86da17fb49d98e9"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "d4f6102091511e8c83950246fbcdcccf7b7ae96c3ac6a1320ed224548bc7c894"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "48f92bfcf887cb84a2d07caa5c52dc8cbbf7e03a12e10a698ea300a56da14d98"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "bd2b40eb62fb0a55f16a3d4fdfde72375bdb0aad722bc0a3ec3e673fd95ec95f"
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
