class Hydra < Formula
  desc "Fast, resilient, multi-source file retriever and download engine"
  homepage "https://github.com/ja7ad/hydra"
  url "https://github.com/ja7ad/hydra/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "df991e2d195e017c1253178ff14cd755de647aff3e8fe1ce4d0526462e32e08e"
  license "GPL-3.0-or-later"
  head "https://github.com/ja7ad/hydra.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/hydra-cli")

    man1.install Dir["docs/man/*.1"] if Dir.exist?("docs/man")

    generate_completions_from_executable(bin/"hydra", "completions")

    # "hydra" is also THC-Hydra, which Homebrew ships as hydra too, and three
    # letters types better for a command run as often as a download. A
    # symlink, so it follows whatever "hydra" this keg has.
    bin.install_symlink bin/"hydra" => "hya"
    # A completion script names the command it completes, so the short name
    # needs its own set.
    generate_completions_from_executable(bin/"hydra", "completions", "--bin-name", "hya",
                                         base_name: "hya")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hydra --version")
    assert_match version.to_s, shell_output("#{bin}/hya --version")
  end
end
