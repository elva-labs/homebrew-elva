# typed: false
# frozen_string_literal: true

class ChordRemoteBeta < Formula
  desc "Chord on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/chord"
  version "1.0.0-beta.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-aarch64"
      sha256 "d4c1c8fc15adabac65b23b4162cfe959721b1b8cbf5bb7c987ecb63773e281f7"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-x86_64"
      sha256 "315b9516f38d8c4824d12e2ccf934a39a14784594e0529adb55f695994f58443"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-aarch64"
      sha256 "18432dcd9d4a5d6ff8b06cc6edae4426ddcaa2b4ed4e92884181e4f003e916ba"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-x86_64"
      sha256 "3cf327cc5a841a833af78b85a910420fc6b53e4a1c2dd4517e6aac799dd5602b"
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
