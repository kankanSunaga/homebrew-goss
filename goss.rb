# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Goss < Formula
  desc ""
  homepage ""
  url "https://github.com/kankanSunaga/goss/archive/0.0.1.tar.gz"
  sha256 "7229e449810ba70d66684fcc361f4634d0eb57fdd50ed7e7bf21503b74441717"

  # depends_on "cmake" => :build

  def install
    print buildpath
    ENV["GOPATH"] = buildpath
    goss_path = buildpath/"src/github.com/kankanSunaga/goss/"
    goss_path.install buildpath.children

    cd goss_path do
      system "dep", "ensure", "-vendor-only"
      system "go", "build"
      bin.install "goss"
    end
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test goss`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
