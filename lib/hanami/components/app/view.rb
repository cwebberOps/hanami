module Hanami
  module Components
    module App
      # hanami-view configuration for a sigle Hanami application in the project.
      #
      # @since x.x.x
      # @api private
      class View
        # Configure hanami-view for a single Hanami application in the project.
        #
        # @param app [Hanami::Configuration::App] a Hanami application
        #
        # @since x.x.x
        # @api private
        #
        # rubocop:disable Metrics/AbcSize
        # rubocop:disable Metrics/MethodLength
        def self.resolve(app)
          config    = app.configuration
          namespace = app.namespace

          unless namespace.const_defined?('View', false)
            view = Hanami::View.duplicate(namespace) do
              root   config.templates
              layout config.layout

              config.view.__apply(self)
            end

            namespace.const_set('View', view)
          end

          Components.resolved "#{app.app_name}.view", namespace.const_get('View').configuration
        end
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
    end
  end
end
