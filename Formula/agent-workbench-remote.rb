# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemote < Formula
  desc "Agent Workbench on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/agent-workbench"
  license "MIT"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "842f11667837589b9309a66b2df165464a77b8d8267182fba912e012bb27c875"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "da6c97175b4db00ac5ca7551b3ace15a3891b852150e6469243de95dc6429c85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "7391283b2bb2cbe75173cefb8c22982b48601bfecd8ec2b349cf95d9c3a07568"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "9e91a740524e5fac3a046a9591b4318864dfa86f6fe668d16e9d460ffd597825"
    end
  end

  def install
    binary = Dir["agent-workbench-remote-*"].first
    bin.install binary => "agent-workbench-remote"
    chmod 0755, bin/"agent-workbench-remote"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/agent-workbench-remote version").strip
  end
end
