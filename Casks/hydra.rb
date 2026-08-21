cask "hydra" do
  version "0.3.5"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "89a92ea348cd6d7dffa5fcfe554a2b2fdbaf1c951991a38f4550c64c1ffccbba",
           intel: "b8ecea8d2fc6c23c88c27ef23dbf539f5aa2a209bbae4e29e710147fe97385de"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"

    depends_on macos: :big_sur

    app "Hydra Download Manager.app"
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
    manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"
  end
  on_linux do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "2be7e02d0129ae01d23d9aea7989336dbbf9bd39ed447956cf90dabd776fc689",
           intel: "a084bffe3ba215698f129792330d20ca6b31fbb59f4962a4bfb07399b3c01d1c"

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
