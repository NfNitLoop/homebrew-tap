class Sned < Formula
  desc "Send files/messages or SSH/TCP connections via P2P Iroh/QUIC connections"

  # IMO the "real" home page, but crates.io returns a 403 to `brew audit`.
  # homepage "https://crates.io/crates/sned"
  homepage "https://codeberg.org/nfnitloop/sned/src/branch/main/crates/sned"

  url "https://codeberg.org/nfnitloop/sned/archive/v0.3.1.tar.gz"
  sha256 "8b674a0bd81baa8bf9f50700373e2667550265eb4991eafc5a6b97461972f39d"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "./crates/sned")
  end

  test do
    assert_equal "sned 0.3.1", shell_output("#{bin}/sned --version").strip
  end
end
