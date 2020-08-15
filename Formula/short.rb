class Short < Formula
  desc "Concise cli launcher / project manager using env files"
  homepage "https://github.com/vincent-herlemont/short"
  url "https://github.com/vincent-herlemont/short/archive/v0.3.4.tar.gz"
  sha256 "6c6ce5f3e3e3af1c7f3f802f3099fac8c21dfd68b14c8d3417d1e5c4407f040a"
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