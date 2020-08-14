class Short < Formula
  desc "Concise cli launcher / project manager using env files"
  homepage "https://github.com/vincent-herlemont/short"
  url "https://api.github.com/repos/vincent-herlemont/short/tarball/v0.3.3"
  sha256 "e2d07b06e65e651abae880a7612d806d7d042fb712c8151ecca668321c8e73ba"
  license ["Apache-2.0", "MIT"]

  depends_on "openssl" => :build
  depends_on "rust" => :build
  depends_on "libgit2"

  def install
    cmd="cargo vendor"
    puts cmd
    IO.popen(cmd) { |io| while (line = io.gets) do puts line end }
    cmd="cargo build --release --locked --frozen --features disabled_check_new_version"
    puts cmd
    IO.popen(cmd) { |io| while (line = io.gets) do puts line end }
    bin.install "target/release/sht" => "sht"
  end

  test do
    system "false"
  end
end
