# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemote < Formula
  desc "Agent Workbench on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/agent-workbench"
  license "MIT"
  version "0.7.6"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "838ebb3a0a879504e844ab2118ac5ee61832aa22f9507db975689bc888a6d893"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "042618ee305ba5cc376a7e42cab48ff8c4fdefd976ae2bda1c102b34aec06f1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "eab529f96c8e5512f4864b3ff19bfb159a6fb326c994a535c2ad19e6ff8da82b"
    end
    on_intel do
      url "https://github.com/elva-labs/agent-workbench/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "0558fd22bc7c1afe074632ec14e76d14e79732bdc9cebc7846ef329c67df49d0"
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
