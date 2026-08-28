# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202608280751"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280751/awsesh-darwin-x64.zip"
      sha256 "7497b16deb3f665b63de62a7830d14616dd60422a81181fddf05ce8dd154b62b"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280751/awsesh-darwin-arm64.zip"
      sha256 "7aa66473838bd249038580130e4902ec0b7e775ebeba2c951774c2811455e5dc"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280751/awsesh-linux-x64.tar.gz"
      sha256 "a677b0ff5dcb0233bd0ee0e698a6502d2e3851c3c4695bdcb7030001fed36df0"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280751/awsesh-linux-arm64.tar.gz"
      sha256 "9160aa370170f9a38a207fe5f4e94c6834b83fa02d03e1daf0e4ddd8c0d1453b"
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
