# frozen_string_literal: true

# This formula is auto-bumped by the bump.yml workflow in this tap whenever the
# main glnc repo publishes a release. Manual edits to `version`, the `url`s, or
# the `sha256`s WILL BE OVERWRITTEN on the next release. If you need to patch
# the formula by hand (e.g. a Homebrew style fix), edit other fields and the CI
# bumper will preserve your changes.
#
# TODO(license): Confirm the upstream license. Placeholder is MIT — update once
# the main repo's LICENSE file is finalized.
class Glnc < Formula
  desc "Blockchain inspection CLI for EVM, Bitcoin, and Solana"
  homepage "https://github.com/aryarahimi1/glnc"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-darwin-arm64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-darwin-arm64.tar.gz"
      sha256 "94b7e961b62c431af0d7812439b55f4c23b5df47453bcb5c9a03550b288552c1"
    end

    on_intel do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-darwin-x64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-darwin-x64.tar.gz"
      sha256 "f6cbe43621d20a2678a1f34fa7b7d2a46222c5fb7a37fb76474537e202b44241"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-linux-arm64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-linux-arm64.tar.gz"
      sha256 "54adb1cdcbd7e2592853dc234aea10b257b77f9bf268f5b75a439ba6658e392f"
    end

    on_intel do
      url "https://github.com/aryarahimi1/glnc/releases/download/v#{version}/glnc-linux-x64.tar.gz"
      # sha256 from SHA256SUMS, line: "<hash>  glnc-linux-x64.tar.gz"
      sha256 "f71714547999900cb5bc0dd826b346691dbf853e697ce4903d0c5ba431aea200"
    end
  end

  def install
    # Each tarball contains a single per-arch binary at the top level. Rename
    # it to `glnc` and drop it into the prefix's bin directory.
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "glnc-darwin-arm64" : "glnc-darwin-x64"
    else
      Hardware::CPU.arm? ? "glnc-linux-arm64" : "glnc-linux-x64"
    end

    bin.install binary_name => "glnc"
    chmod 0755, bin/"glnc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glnc --version")
  end
end
