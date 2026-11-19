# typed: false
# frozen_string_literal: true

class AgentWorkbenchRemoteBeta < Formula
  desc "Chord on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/chord"
  version "1.0.0-beta.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-darwin-aarch64"
      sha256 "09e09fe55bb102a21e39168e2438f34e49ce75049eb1e016b3487ddd4655d386"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-darwin-x86_64"
      sha256 "de52fe6d0ea375fe4aad01185db11b4ce48479d5624412a6bb0a41216467861d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-linux-aarch64"
      sha256 "b53b83e4cf89ea1230bfbc25723bd29627ff1f6db9575965ba5c07344c2c65c4"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/agent-workbench-remote-linux-x86_64"
      sha256 "2eb163912c9c8ba1665c87077ed4966e951bdca2f37581fd2fc9270320de32f2"
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
