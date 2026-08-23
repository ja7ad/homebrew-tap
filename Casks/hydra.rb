cask "hydra" do
  version "0.3.10"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "5171b5ec9de2c27cfdbaceadd650fc1d0fdee19a83dc5610031d882986cc7bdc",
           intel: "2f4d112720355e427ba8d225d150564ce2d9ebf6a21253d0f17ff8d85586c68a"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"

    depends_on macos: :big_sur

    app "Hydra Download Manager.app"
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
    manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"
  end
  on_linux do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "4a0a3fadb12f4933a2aa428998e0bb5a11ab6cf6039788f682e3ffa4a946dcf5",
           intel: "46036ae66423d45392be024e70e4649b15e7e9bac60695a4d36240f4c48b530f"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/hydra-#{version}-linux-#{arch}.tar.gz"

    binary "hydra-#{version}-linux-#{arch}/hydra"
    binary "hydra-#{version}-linux-#{arch}/hydra-gui"
    binary "hydra-#{version}-linux-#{arch}/hydra-host"
    manpage "hydra-#{version}-linux-#{arch}/man/hydra.1"
  end

  name "Hydra"
  desc "Multi-source file retriever and download manager"
  homepage "https://github.com/ja7ad/hydra"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  zap trash: [
    "~/.config/hydra",
    "~/Library/Application Support/Hydra",
    "~/Library/Preferences/io.github.ja7ad.hydra.plist",
    "~/Library/Saved Application State/io.github.ja7ad.hydra.savedState",
  ]
end
