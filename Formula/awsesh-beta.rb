# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601221600"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601221600/awsesh-darwin-x64.zip"
      sha256 "fdb63e5f79521d7072a05a0df07ea69472a870630ce5ba494297105d2392974d"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601221600/awsesh-darwin-arm64.zip"
      sha256 "dd80dd7d23c5ec4a453776031e678dba556e9137492cbd0bbc492907eab07ff1"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601221600/awsesh-linux-x64.tar.gz"
      sha256 "203e0f8cae6dd3e79cf8e50e4dc6ee04eb5ce955545201d6cab7cec12fd286b0"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601221600/awsesh-linux-arm64.tar.gz"
      sha256 "29aed431b3caa15cf027552346a63f1c84d2e76e80416aa6b29376041b55c8ee"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  test do
    system "#{bin}/awsesh", "--version"
  end
end
