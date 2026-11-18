# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.4.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.5/awsesh-darwin-x64.zip"
      sha256 "ba908957ef783f582b64845e85e65cf14d1a76e20c4457a050c63b5a3adce3f3"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.5/awsesh-darwin-arm64.zip"
      sha256 "34fab520acacc70c05395c23577401ad67f4d0b6d94fdaf4cefc17f68e720186"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.5/awsesh-linux-x64.tar.gz"
      sha256 "18481fb66516e9cd74bf538e838e102d8a0c3d34c5c0cd47f0c505329f85a4ff"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.4.5/awsesh-linux-arm64.tar.gz"
      sha256 "acc5dee80e1c97ac825ca811f77dc5d613d0ed49be32fb2c7a725e6222ba3c07"
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
