# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202608280719"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280719/awsesh-darwin-x64.zip"
      sha256 "4e48803ca750607c43d0eb17fef19b805a50a9cd3bd295fed68016f2fe018ddb"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280719/awsesh-darwin-arm64.zip"
      sha256 "a8409a2741e6564bf205904db20c41f007550e4181cd445fb56999d78773222a"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280719/awsesh-linux-x64.tar.gz"
      sha256 "5fcac5b794a94223cd17f6db546e542b4d6c7b287d38efe038547459cd0f378d"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202608280719/awsesh-linux-arm64.tar.gz"
      sha256 "259adfb17995aa8e99a30db635715149968205b7281a99e6a1b70b462c6bd988"
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
