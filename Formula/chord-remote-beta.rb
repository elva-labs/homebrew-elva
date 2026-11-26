# typed: false
# frozen_string_literal: true

class ChordRemoteBeta < Formula
  desc "Chord on another machine: the daemon a desktop reaches over ssh"
  homepage "https://github.com/elva-labs/chord"
  version "1.0.0-beta.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-aarch64"
      sha256 "cb78f220de4e05617684cde47da9c1f6ddd18afff8a251d05d4627806f81a82f"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-darwin-x86_64"
      sha256 "22f3cb64ac2ecc6082b985a995e619c3fceefcdc950426766efc3c401275ae0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-aarch64"
      sha256 "3eea5f112ddaed3ec11fab65678b65bf967d572b85d963ba165062f4025f0bc2"
    end
    on_intel do
      url "https://github.com/elva-labs/chord/releases/download/v#{version}/chord-remote-linux-x86_64"
      sha256 "61a64239b52726db5fc39f7a5a916ac4604243213243548d373859ce734ef190"
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
