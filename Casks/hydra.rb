cask "hydra" do
  version "0.6.1"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "36b5a7427eaab70b952b5973630bbea45cd87186b407f8a883e44dfb4addc04a",
           intel: "30d0f003f45fc5c37a4fd8add5f6c131e611822fba47b7201c15536d43dd3684"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"

    depends_on macos: :big_sur

    app "Hydra Download Manager.app"
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
    # The short second name, for the same reason the formula has one.
    binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra", target: "hya"
    manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"
  end
  on_linux do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "0f54b1bbeb7c42d74a3f6a42cf5f2b29ca9b627b905a133c6e62e4fd9719c694",
           intel: "afd9a9017b9cfe29cea3a7ee22ee500cfb90a00958fbf2f31bc3a4a4264d6548"

    url "https://github.com/ja7ad/hydra/releases/download/v#{version}/hydra-#{version}-linux-#{arch}.tar.gz"

    binary "hydra-#{version}-linux-#{arch}/hydra"
    binary "hydra-#{version}-linux-#{arch}/hydra", target: "hya"
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
