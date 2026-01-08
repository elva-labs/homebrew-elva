# typed: false
# frozen_string_literal: true

class AwseshAlpha < Formula
  desc "AWS SSO session manager CLI (alpha)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-alpha.202601081351"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601081351/awsesh-darwin-x64.zip"
      sha256 "14f5c3b6a39ab590196b13c9697e50a0f9fc5b22d7bcfccca8b4b25384547fb7"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601081351/awsesh-darwin-arm64.zip"
      sha256 "ec78ab6d939d678bfea67ffa507fe24277efa3b54d675a2e85b8e8fe0eff965a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601081351/awsesh-linux-x64.tar.gz"
      sha256 "15a34e8c1ca30113fe543ae71cd7f14180f5974ed57b568146b4ed03a8b59ef6"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-alpha.202601081351/awsesh-linux-arm64.tar.gz"
      sha256 "bde8f259b16d5f7f2acc99db3871de12aebb3b3367fb22b0afe7aa25168849cf"
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
