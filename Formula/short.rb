class Short < Formula
  desc "Concise cli launcher / project manager using env files"
  homepage "https://github.com/vincent-herlemont/short"
  url "https://github.com/vincent-herlemont/short/archive/v0.3.5.tar.gz"
  sha256 "deb8016dce423ec873cca72096f6dc52be942b614a397b8cdda1aef967397c6c"
  license ["Apache-2.0", "MIT"]

  depends_on "openssl" => :build
  depends_on "rust" => :build
  depends_on "libgit2"

  def install
    cmd="cargo vendor"
    puts cmd
    IO.popen(cmd) { |io| while (line = io.gets) do puts line end }
    cmd="cargo build --release --locked --frozen --no-default-features"
    puts cmd
    IO.popen(cmd) { |io| while (line = io.gets) do puts line end }
    bin.install "target/release/sht" => "sht"
  end

  test do
    system "false"
  end
end