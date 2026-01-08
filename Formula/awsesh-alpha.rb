# typed: false
# frozen_string_literal: true

class AwseshAlpha < Formula
  desc "AWS SSO session manager CLI (alpha)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-alpha.202601080928"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601080928/awsesh-darwin-x64.zip"
      sha256 "7a115b8a7f81db8cb500a026a57ed5c125bc1ab28c16c8d403f2989c48f1d8a2"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601080928/awsesh-darwin-arm64.zip"
      sha256 "40cde6f822996d1fe591001da4b353bcdb670d8011d0e638838db23d4d06bbad"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601080928/awsesh-linux-x64.tar.gz"
      sha256 "28f66794a5551b482179b85c7858ac25a8f0fd12f460cb56855d72d82d7d3a2f"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601080928/awsesh-linux-arm64.tar.gz"
      sha256 "76134579e11cacbd398ba25d2e053b0bbd2580a886079d07073c71c35dc8f467"
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
