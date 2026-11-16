# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemoteBeta < Formula
  desc "Agent Workbench on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/agent-workbench"
  version "1.0.0-beta.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "58dcfc1e51720835dc4082b5f4d6e72b7b8c43014d7da9507e51f7d52f7eb16f"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "aa8881abad3a99fc8670e9d9de954bc497def408c7289b5b39fdbc2a20716fdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "705d3a80b987360cdb8b86de8c51dfd0eb008dcc2d33298e9f138eeaf6f68ac6"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "b2c5f3f4172a6bc0899b74ae478a3ede5871a6de3baec06a6b5dc5d3ea3ba97f"
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
