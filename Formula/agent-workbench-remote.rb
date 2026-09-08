# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemote < Formula
  desc "Agent Workbench on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/agent-workbench"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "e30644b3fded2fd9a375aeef0e2e0711234e2bd652b5418d5b6e9afc2c7c662a"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "12cf2190c0f92fa2ee9f995bcf0fd7e88b857510baff8927b4563d8f7d64caf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "1dc3ec87d568436ee70a01adde5d861125a3ca18b42ab4fc61460a523e339003"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "c25e8f7875b03ebf1dfaea59378a4323d6409517ea8f12ad888cb8254186024b"
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
