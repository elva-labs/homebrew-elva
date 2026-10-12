# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.2.0/awsesh-darwin-x64.zip"
      sha256 "7d16a769957192092b1ef7beca143098b61c0d3f631fc26fa14ad4ad739986b8"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.2.0/awsesh-darwin-arm64.zip"
      sha256 "5a829075228841b0a77bde715c6b3130322de41b56ef7956dff9915321ea0c81"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.2.0/awsesh-linux-x64.tar.gz"
      sha256 "950ac8351d41fb9572d24f88787dd32b9b6755148ccbc3c0b9e0eaf4f074df9e"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.2.0/awsesh-linux-arm64.tar.gz"
      sha256 "bf3da92465fb8ca82672845ed5cd02d844d8b4bc0291b7fc7b0f1c40a6617ce8"
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
