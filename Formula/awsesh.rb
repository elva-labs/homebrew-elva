# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.5.0/awsesh-darwin-x64.zip"
      sha256 "6a7eebdcc8c4693c7a076bd6c455af0279df58823b2d5124dc7399b7ae55168b"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.5.0/awsesh-darwin-arm64.zip"
      sha256 "fbf6f9de4f6b9b75a0b2726a26697df049299f7d128265933c44a64aac7b0620"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.5.0/awsesh-linux-x64.tar.gz"
      sha256 "212ea6d37daa1c0f145413f30e94250cf6f2b950938c18a612c5b5f4a85b84f8"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.5.0/awsesh-linux-arm64.tar.gz"
      sha256 "db9f3183411876f79b4973633d5b7023ba85bc8a009b8c706c06afe0e5511e8b"
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
