# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202608280810"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280810/awsesh-darwin-x64.zip"
      sha256 "f1a9fe69c17b2bdb782b742f9df6f5e256a1d6641d80a0c3baa416e951759f48"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280810/awsesh-darwin-arm64.zip"
      sha256 "284a72dd6460473c004c6bfd986029576307b1055ad3a7e24d6dc51cabd9adea"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280810/awsesh-linux-x64.tar.gz"
      sha256 "46fefe8401bd663be28fe8f8934049cfac63da84bed802d6bf738e796d47617e"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280810/awsesh-linux-arm64.tar.gz"
      sha256 "f5fa8f95099120e121d620a30a5f515f88ce767b72be23743756ce63f89845bc"
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
