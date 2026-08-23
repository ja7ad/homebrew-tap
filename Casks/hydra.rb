cask "hydra" do
  version "0.3.9"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "ce7ee816a5270ab694531e0759d8d19b8fff376073d056129cbfe868944a1649",
           intel: "8bb7511acf979c95642326dc0d434a6bc453c833f00b6c23e86cd502d3a87469"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"

    depends_on macos: :big_sur

    app "Hydra Download Manager.app"
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
    manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"
  end
  on_linux do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "832ff925801e1691e54ade739fac78713cc98a059b92139782676d61d269ed61",
           intel: "c4d7aea244ab828c32b4557aec8d27c8a20945413dc1db9ea429d2b39cdc8179"

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
