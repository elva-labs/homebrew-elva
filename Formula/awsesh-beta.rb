# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601241355"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241355/awsesh-darwin-x64.zip"
      sha256 "f64d5caf54fb1bb94a683d3f0abf52405f451a1bc87188e2dbcb5caaf4fe2065"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241355/awsesh-darwin-arm64.zip"
      sha256 "f8aafcfb118890e2e9c1a8274f1c339c96fef97683e8187b6616c93070fa9c44"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241355/awsesh-linux-x64.tar.gz"
      sha256 "01ce3d38e43d194c35ecbc008331f64ebeba0840a83251400c0ab6dbf1869ff2"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601241355/awsesh-linux-arm64.tar.gz"
      sha256 "501c8d942bd71d4a79773bd2cea91628b57c5c6789eb496672317c3a08c0c186"
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
