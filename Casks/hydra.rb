cask "hydra" do
  version "0.4.2"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "9ede1326a9a364a8668a47304092fa0c670bad8251231a605b1cfd9eda71c10f",
           intel: "1655dc3621cdd5554d6ba08c8b80fcd566697894f1eff0009138f3ddb81c177d"

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

    sha256 arm:   "6ee9babb3c373eef2bec092147c1a85c8398d2da245ee50238f9d74f660b3a83",
           intel: "e5a38ae610d88ee768106413cd760b8ec78bccf0910729613d06d7bfd80e314a"

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
