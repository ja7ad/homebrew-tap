class Hydra < Formula
  desc "Fast, resilient, multi-source file retriever and download engine"
  homepage "https://github.com/ja7ad/hydra"
  url "https://github.com/ja7ad/hydra/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "315272e31d53dc37785c1cced5034a1f991262b033ab7f5ac3ccbd8bd73e7a58"
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
