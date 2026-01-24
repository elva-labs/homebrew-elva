# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601241025"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241025/awsesh-darwin-x64.zip"
      sha256 "dbbf9f809d01e3ec774253b697bf97af2a5f7713b0b41110d6653fa767526690"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241025/awsesh-darwin-arm64.zip"
      sha256 "71767a6a0cca6a426b485ce9df38471621bb474e0f4392c0dbf249ed4a466862"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241025/awsesh-linux-x64.tar.gz"
      sha256 "2565e265bd0e9fffe5acaa4e18704c479a9b15503aa999bd8ca5be39e5525492"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241025/awsesh-linux-arm64.tar.gz"
      sha256 "e3c60d437ed7ddd982a8473d25644b7d8a81283ab2da7121ce1b75382cbffa3f"
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
