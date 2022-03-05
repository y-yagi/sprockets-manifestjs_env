require "rails"

module Sprockets
  module ManifestjsEnv
    class Railtie < ::Rails::Railtie
      initializer "sprockets-manifestjs_env_set_precompile", after: :set_default_precompile do |app|
        manifestjs = "manifest_#{::Rails.env}.js"
        if ::Rails.root.join("app/assets/config/#{manifestjs}").exist?
          app.config.assets.precompile[0] = manifestjs
        end
      end

      initializer "sprockets-manifestjs_env_set_assets_path", after: :append_assets_path do |app|
        manifestjs = "manifest_#{::Rails.env}.js"
        if ::Rails.root.join("app/assets/config/#{manifestjs}").exist?
          # TODO: If `manifest.js` for an environment exists, this gem assumes that an application doesn't use
          #       the default build directory. But this should be configured by an application.
          app.config.assets.paths.delete_if { |d| d.end_with?('app/assets/builds') }
        end
      end
    end
  end
end
