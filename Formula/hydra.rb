class Hydra < Formula
  desc "Fast, resilient, multi-source file retriever and download engine"
  homepage "https://github.com/ja7ad/hydra"
  url "https://github.com/ja7ad/hydra/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "66f243a04355c737c2afdbbc8496b2ec2a5217f71037e5e5fc61decd6782215a"
  license "GPL-3.0-or-later"
  head "https://github.com/ja7ad/hydra.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/hydra-cli")

    man1.install Dir["docs/man/*.1"] if Dir.exist?("docs/man")

    generate_completions_from_executable(bin/"hydra", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hydra --version")
  end
end
