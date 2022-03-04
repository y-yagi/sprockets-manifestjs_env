require "rails"

module Sprockets
  module ManifestjsEnv
    class Railtie < ::Rails::Railtie
      initializer "sprockets-manifestjs_env", after: :set_default_precompile do |app|
        manifestjs = "manifest_#{::Rails.env}.js"
        if ::Rails.root.join("app/assets/config/#{manifestjs}").exist?
          app.config.assets.precompile[0] = manifestjs
        end
      end
    end
  end
end
