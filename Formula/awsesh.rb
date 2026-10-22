# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.3.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.1/awsesh-darwin-x64.zip"
      sha256 "be2c677204a16dc02cb8d47de162ce2989817b468822dbded42e0a4a34b44de4"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.1/awsesh-darwin-arm64.zip"
      sha256 "7f0793d5a2afb394fb6097b98e8c3e8203ac830a137b607b2de937cb61d945a9"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.1/awsesh-linux-x64.tar.gz"
      sha256 "14364cb060836beec720057394f91ed87532147f7d77b870743d732bdae2d3a5"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.3.1/awsesh-linux-arm64.tar.gz"
      sha256 "6ee4a27eaee07989afff1abf505223a33129998e26b5f4dd512f7e69953ee03c"
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
