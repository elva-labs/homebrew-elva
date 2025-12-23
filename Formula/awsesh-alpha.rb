# typed: false
# frozen_string_literal: true

class AwseshAlpha < Formula
  desc "AWS SSO session manager CLI (alpha)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-alpha.202512231130"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512231130/awsesh-darwin-x64.zip"
      sha256 "e82a5c25397415f3e746f8ecccd55121ba9d2f83d5fd41d0a0cdd2eb318cd44e"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512231130/awsesh-darwin-arm64.zip"
      sha256 "25411a7b07010933dae24ae9f5396e6a9bc0583a9d24d28483db3a24f18d5fd3"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512231130/awsesh-linux-x64.tar.gz"
      sha256 "3edcf314306747cdf64283f6c36ebd2632e1682109b8f8cbcc08a43b6fb250f3"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202512231130/awsesh-linux-arm64.tar.gz"
      sha256 "8a028a1d291898d52aa03892530fae8a0d4089c0b80f45bb88d8a2c6ed1cbfd7"
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
