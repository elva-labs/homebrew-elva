# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.4/awsesh-darwin-x64.zip"
      sha256 "6eba67ae5129c930ea3e68637a6931635c57cd5b44e240dea223eaa6dd2c588a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.4/awsesh-darwin-arm64.zip"
      sha256 "658393383a13d4a0a1c44c512027a2957bc9e0c03d69339a2465efe7a4b75684"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.4/awsesh-linux-x64.tar.gz"
      sha256 "1a8ac356af17d7e3c46be9ade8875f4ba6c13c808098927685ec9e653dccaf92"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.4/awsesh-linux-arm64.tar.gz"
      sha256 "e420512455319d94519550e1ad6863e1a7a89b2d690de038749a001f262bd242"
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
