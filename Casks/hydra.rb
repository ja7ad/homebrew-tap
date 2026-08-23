cask "hydra" do
  version "0.3.11"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "57dcb5ba5d4fd662b85b6a8f6da7fe651ed2acfa52b5cee7cd26b89d0b8e7eb3",
           intel: "b6e2f9d26b5fd841707ef0a80853aa6ef00f75514b6352ae615a9352320ac1ca"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"

    depends_on macos: :big_sur

    app "Hydra Download Manager.app"
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
    manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"
  end
  on_linux do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "d0e6533d1d5b0de23a887cef29493d727f813a10cb158bed3c1276a50c0928ae",
           intel: "8a18fe63af9ce78287a936df3c5098662eb9fd52f1824380a2d41125d86f4d23"

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
