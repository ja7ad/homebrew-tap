cask "hydra" do
  version "0.6.0"

  on_macos do
    arch arm: "arm64", intel: "x86_64"

    sha256 arm:   "54234cb2d699047e79e04ad84d51541b69101a68c4e8ae36812c95adad43cdd4",
           intel: "017858c7587f9083aab696dd4b7d4e3986c0db9cc3fd06d2f9556b8a21eac128"

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

    sha256 arm:   "44e6912655fa1058bc0e011cf5c32d7c3346ccf08df3d61a26a1e4e53ccd38a8",
           intel: "448b9b12edf447e8ffaff48d3a2d592feba9343faa9a157dd0182e73295de2e1"

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
