# typed: false
# frozen_string_literal: true

class Awsesh < Formula
  desc "AWS SSO session manager CLI"
  homepage "https://github.com/elva-labs/awsesh"
  license "MIT"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.1/awsesh-darwin-x64.zip"
      sha256 "1272226ae4751e3e219042c9a8342b965ec6df0c1690de243c2ccb01dec788ff"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.1/awsesh-darwin-arm64.zip"
      sha256 "1dcd1befd974e03c749f83021b146decdf0617219b5ffcc06b8b86ce99ebca3e"

      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.1/awsesh-linux-x64.tar.gz"
      sha256 "4233d15c74a59fedb1c33d0f3113f02c61ae638fd96bcbfc7c873362f0deb793"
      def install
        bin.install "awsesh"
        bin.install_symlink "awsesh" => "sesh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/elva-labs/awsesh/releases/download/v1.0.1/awsesh-linux-arm64.tar.gz"
      sha256 "9d55188f082f173c138eb941db316dc6495c9975ae0226d1ad3dc0d622dcf76c"
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
