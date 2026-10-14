class Ncly < Formula
  desc "Curated multilingual CLI toolbox for humans and agents"
  homepage "https://github.com/pascalandy/nicely"
  url "https://github.com/pascalandy/nicely/releases/download/v0.2.1/ncly_0.2.1_source.tar.gz"
  sha256 "0a07b41ab8238d9f21dc941ab05d9832f513d98d2f0ffc4579f132f5c05c9fdb"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-buildvcs=false", "-ldflags=-s -w -X github.com/pascalandy/nicely/internal/cli.version=v0.2.1", "-o", bin/"ncly", "./cmd/ncly"
    generate_completions_from_executable(bin/"ncly", shell_parameter_format: :cobra)
    (pkgshare/"licenses").install "LICENSE", "THIRD_PARTY_LICENSES"
  end

  test do
    assert_equal "ncly v0.2.1", shell_output("#{bin}/ncly --version").strip
  end
end
