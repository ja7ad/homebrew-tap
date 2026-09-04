cask "hydra" do
  version "0.4.1"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "846aefb510f97b6c9fc6e0f60a5a4e3362fa6bf25dd6da8e4414ba39b404cec9",
           intel: "1f2cf70016f75c705e156c77429d0c65181bb2e35eeb21f136ced541d5c887db"

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

    sha256 arm:   "5ea4c49e5d96f620d81d514862be94e9704aa80e66a05fd15ea857d28fbe4a22",
           intel: "6ab56c7aaf332da7ffab7644ce1b083d9d2d6434d4d6dcecd78394eac30e58f5"

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
