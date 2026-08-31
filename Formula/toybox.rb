# typed: false
# frozen_string_literal: true

class Toybox < Formula
  desc "Small toolbox of games for the terminal"
  homepage "https://github.com/elva-labs/toybox"
  license "MIT"
  version "1.0.0"
  url "https://github.com/elva-labs/toybox/releases/download/v1.0.0/toybox-1.0.0.tar.gz"
  sha256 "10d1b77a3d6b5fd0db55ef2c5f72cd23ab6a863b427688a27f4681e30862649e"

  depends_on "node"

  def install
    bin.install "toybox.js" => "toybox"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/toybox --version").strip
  end
end
