# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.2/awsesh-darwin-x64.zip"
      sha256 "ccfd36b3a2a6fb410a074126fc3f6f40af3c6f737e2198ddcf124c29a58c20d1"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.2/awsesh-darwin-arm64.zip"
      sha256 "85eb07df1c31573dc5280053114e7983b3517aa17fa59179d3d8e224edc45fad"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.2/awsesh-linux-x64.tar.gz"
      sha256 "02a3d293c979c75db6b1225b7d3445667483fb0e2f3767e941593ff3d3b6bccb"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.2/awsesh-linux-arm64.tar.gz"
      sha256 "7d487e9585bf882832716d8424445fc482abedebce92057a47407de79830e66e"
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
