# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601241326"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241326/awsesh-darwin-x64.zip"
      sha256 "1bcec6fc96403b8aae7cf2f24ab4b653bdfb8e3906747f9cb30bb4eda8aa2c8e"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241326/awsesh-darwin-arm64.zip"
      sha256 "3793f404fc7827a293f70b36cd1a6e5efa6a73a7e1a595d221c99623cccb2fbf"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241326/awsesh-linux-x64.tar.gz"
      sha256 "3ff41b8664418fdcd0446a6f75bae540d42f000073bb4fdfe41d7baff05fdfeb"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241326/awsesh-linux-arm64.tar.gz"
      sha256 "a7612a734eeb085f8b4c5063f111c80a673a04111b7bc4a59093ed855a8e2d67"
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
