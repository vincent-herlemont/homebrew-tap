class Short < Formula
  desc "Concise cli launcher / project manager using env files"
  homepage "https://github.com/vincent-herlemont/short"
  url "https://github.com/vincent-herlemont/short/archive/v0.3.6.tar.gz"
  sha256 "1ef98ca8f8ee457d1bcbc96509894994c27911d1a92380d239e2c3992b834881"
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