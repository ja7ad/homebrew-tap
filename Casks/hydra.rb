cask "hydra" do
  version "0.2.3"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "702d36d6d790bd5f2080d419587b6e0e1d4a4c2e9f0235d6a06fc98033eee8ec",
           intel: "a91ff7ee0f74199581dd5b4b9cee35ce016bd3f37cff9ad502cacfbbad11fb49"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"

    depends_on macos: :big_sur

    app "Hydra Download Manager.app"
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
    manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"
  end
  on_linux do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "d43d78d54504ddd86bca5283f992521f2230ce989070e5ec6fc09e7321bd6044",
           intel: "fdd1d23c3c59c88ac0d2c56c80d5b6c12c74b4a2d8b33a7ad3ccc512b824af1a"

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
