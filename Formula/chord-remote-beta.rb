# typed: false
# frozen_string_literal: true

class ChordRemoteBeta < Formula
  desc "Chord on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/chord"
  version "1.0.0-beta.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-aarch64"
      sha256 "5270f76e1911a0b3f26f003c6e6d0e0a0ba8a643c804e9c1e8d7b3107e77441e"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-x86_64"
      sha256 "94cafc4cc0f7b27830f9ab9317aa5aec5daf5494c1b061d90caec07720435ad3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-aarch64"
      sha256 "f945c125c3a43d42330495411205f2276ba45a01b72b5a0c664a804b59d39c90"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-x86_64"
      sha256 "7f21cfd723e9bd96291e16831b6cf37013e2238ca98e96fba8c5f59ce2a06810"
    end
  end

  conflicts_with "elva-labs/elva/chord-remote", because: "both install chord-remote"

  def install
    binary = Dir["chord-remote-*"].first
    bin.install binary => "chord-remote"
    chmod 0755, bin/"chord-remote"
  end

  def caveats
    <<~EOS
      A machine paired with Chord before the daemon took this name runs
      the daemon under its earlier name. Run this once to move it over:
        chord-remote migrate
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/chord-remote version").strip
  end
end
