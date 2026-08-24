cask "hydra" do
  version "0.3.12"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "ced6219d6554aa516f883ff487c6d883692e05145207c1143d03dbbc47d29350",
           intel: "3e94e5a556f96cc1e7b7f66b6a67eac77e94d2d0e1e6ff9af9f5a095a4d01339"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"

    depends_on macos: :big_sur

    app "Hydra Download Manager.app"
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
    manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"
  end
  on_linux do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "338a38f17d595ec216a263104f47aa8f7bc244538223371acb2c2c13fc267781",
           intel: "815e8539bbb208fc31fa968d9f1801476d76667e073ea00cbc7543505bf958d7"

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
