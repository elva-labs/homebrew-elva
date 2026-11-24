# typed: false
# frozen_string_literal: true

class ChordRemoteBeta < Formula
  desc "Chord on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/chord"
  version "1.0.0-beta.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-aarch64"
      sha256 "2cdc4336ce5c19e2efd47acea90472cbd221b77e82d6b73071ffde903e8d1f27"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-x86_64"
      sha256 "b71df0ca199e0990263db0d7a6f5879d889888a8fdd9a41371e6fbbe329a12c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-aarch64"
      sha256 "d0aeecc4345d6690ed266e0854e4e035dedcee967a9cc2bb2d24a3a69940f31d"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-x86_64"
      sha256 "c6df73597d7c7ac2c89cc79a6715bf02de32ae55237d906e14a8914a086caef0"
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
