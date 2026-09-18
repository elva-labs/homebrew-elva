# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemote < Formula
  desc "Agent Workbench on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/agent-workbench"
  license "MIT"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "2b0e8d75f0abfb2175d6ee44fe704f098028352bbd4d3b6d27ddfff6fa5fa0d5"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "56790f6a1db15da9825dec9b14ceb4ee29817a5ef3d7e71e5020709903d32ed4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "898132bbce836d3886da5d7cce0bccf0f3e917ff17d751184b8c221b20fbfb42"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "99f67d48595c50cda30497868c29caac49e394a41b49da8cd410aaaba960a711"
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
