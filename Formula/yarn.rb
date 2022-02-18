require_relative "../std_requirements/std_node_requirement"

# https://github.com/Homebrew/homebrew-core/blob/master/Formula/yarn.rb
class Yarn < Formula
  desc "JavaScript package manager"
  homepage "https://yarnpkg.com/"
  url "https://yarnpkg.com/downloads/1.22.13/yarn-v1.22.13.tar.gz"
  sha256 "92b312f0f159c63bbc4ff5f553da8d9b2ffd6886a53c7d9a678c50e2cf4ed321"
  license "BSD-2-Clause"

  livecheck do
    skip("1.x line is frozen and features/bugfixes only happen on 2.x")
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "27d2f4cae93bd17d2038871f7ac6bc8b04d181ebcebd9f976e1701a3def55c8d"
  end

  depends_on "node" => :optional # Make node optional so it's not installed by default & we get --with-node
  depends_on StdNodeRequirement => build.with?("node") # StdNodeRequirement looks for node in std environment

  conflicts_with "hadoop", because: "both install `yarn` binaries"

  def install
    libexec.install Dir["*"]
    (bin/"yarn").write_env_script "#{libexec}/bin/yarn.js",
      PREFIX:            HOMEBREW_PREFIX,
      NPM_CONFIG_PYTHON: "/usr/bin/python"
    (bin/"yarnpkg").write_env_script "#{libexec}/bin/yarn.js",
      PREFIX:            HOMEBREW_PREFIX,
      NPM_CONFIG_PYTHON: "/usr/bin/python"
    inreplace "#{libexec}/lib/cli.js", "/usr/local", HOMEBREW_PREFIX
    inreplace "#{libexec}/package.json", '"installationMethod": "tar"', '"installationMethod": "homebrew"'
  end

  test do
    (testpath/"package.json").write('{"name": "test"}')
    system bin/"yarn", "add", "jquery"
    on_macos do
      # macOS specific package
      system bin/"yarn", "add", "fsevents", "--build-from-source=true"
    end
  end
end
