# typed: false
# frozen_string_literal: true

class AwseshBeta < Formula
  desc "AWS SSO session manager CLI (beta)"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.0-beta.202601081436"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081436/awsesh-darwin-x64.zip"
      sha256 "8d603cc51b3dbecb3d15c473f9f4e101b9cd7f38d161b40096d2269d4fa24757"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081436/awsesh-darwin-arm64.zip"
      sha256 "74e3e18f9dd49b7c33caf8f09028938310f593060018deaff10b072545891d79"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081436/awsesh-linux-x64.tar.gz"
      sha256 "1ac1e393adc33f20b1a717f8a78228bf3811e93f3f8aacc455a15c8758eff1e8"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.0-beta.202601081436/awsesh-linux-arm64.tar.gz"
      sha256 "35cf4eebb29c8d73c3dbe31cb8883044a48225794688fbc8cddfe7420f153b92"
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
