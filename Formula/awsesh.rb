# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.4.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.2/awsesh-darwin-x64.zip"
      sha256 "afa647eee82cb3f6cf0f439afb051f1dc609e96c963c643f4609c51dfc15963f"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.2/awsesh-darwin-arm64.zip"
      sha256 "0f1310388b8c6dc75fc132ea1441f2b0596af15429bbb5e8e32db94b07bb6745"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.2/awsesh-linux-x64.tar.gz"
      sha256 "7c50919da5552fe3dd4676451172b0a05296d93dd9d694fae08439dc8977b8af"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.2/awsesh-linux-arm64.tar.gz"
      sha256 "4e47c1b5281349baf4ee52b882ab229ba7abc789643c562dd84f2b72ed09e195"
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
