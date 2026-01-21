# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601210751"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601210751/awsesh-darwin-x64.zip"
      sha256 "d5215be82c4a85fb85c1f8917df597835eaaed07102ad82228e7a1a40de566ad"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601210751/awsesh-darwin-arm64.zip"
      sha256 "e664f8470979df91491a9f1f24d61dd79c37bd0d2c918ba497918faf8ae2b004"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601210751/awsesh-linux-x64.tar.gz"
      sha256 "4d28dfbb5406999497adaa196d8289ce416932ead344f28df57cf30fb1d684f2"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601210751/awsesh-linux-arm64.tar.gz"
      sha256 "72b86c60a9df180d725b7eb3c0526128ab69fb6d1ca43634597c81ff449ae5b0"
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
