class Sned < Formula
  desc "Send files/messages or SSH/TCP connections via P2P Iroh/QUIC connections"

  # IMO the "real" home page, but crates.io returns a 403 to `brew audit`.
  # homepage "https://crates.io/crates/sned"
  homepage "https://codeberg.org/nfnitloop/sned/src/branch/main/crates/sned"

  url "https://codeberg.org/nfnitloop/sned/archive/v0.3.1.tar.gz"
  sha256 "8b674a0bd81baa8bf9f50700373e2667550265eb4991eafc5a6b97461972f39d"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/NfNitLoop/homebrew-tap/releases/download/sned-0.3.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "16d12447585157225f978a1e5edec479c1bbb483458f934c532ba115ad03365d"
    sha256 cellar: :any,                 x86_64_linux: "0b29ee179424fd8145699edfc722dbdc33fbd2dbdca41e66e6d2c75ad2af3ebc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "./crates/sned")
  end

  test do
    assert_equal "sned 0.3.1", shell_output("#{bin}/sned --version").strip
  end
end

# TODO: Remove me. (Build bottles, please!)
