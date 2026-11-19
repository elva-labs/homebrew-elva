# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemoteBeta < Formula
  desc "Chord on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/chord"
  version "1.0.0-beta.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "2991461dd744fbe9cdb64decc663c4ffefc60c7c556ef29a189ee1d0020b82eb"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "c095aa752b3bd1084dead6f7c99cc814e3ac1cb321c14d0aefea769b9a5b82bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "1844f51fc1b91a453470c1bf25423dfedf1bbe11658045f48864195c43fea050"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "8ab21db34160c82fb669a974944af463dd94a6f127daa48b51756523515217dc"
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
