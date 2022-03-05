require "test_helper"
require "fileutils"

class SprocketsManifestjsEnvTest < Minitest::Test
  def test_run_assets_precompile_without_maninfest_file_for_env
    Bundler.with_unbundled_env do
      Dir.chdir("test/dummy") do
        quietly do
          system("bundle install", exception: true)
          system("yarn install", exception: true)
        end

        system("RAILS_ENV=production rails assets:precompile", exception: true)

        refute_empty Dir.glob("public/assets/application*.js")
        assert_empty Dir.glob("public/assets/test_helper*.js")
      end
    end
  ensure
    FileUtils.rm_rf("test/dummy/public/assets/")
  end

  def test_run_assets_precompile_with_maninfest_file_for_env
    Bundler.with_unbundled_env do
      Dir.chdir("test/dummy") do
        quietly do
          system("bundle install", exception: true)
          system("yarn install", exception: true)
        end
        system("RAILS_ENV=test rails assets:precompile", exception: true)

        refute_empty Dir.glob("public/assets/application*.js")
        refute_empty Dir.glob("public/assets/test_helper*.js")
      end
    end
  ensure
    FileUtils.rm_rf("test/dummy/public/assets/")
  end
end
