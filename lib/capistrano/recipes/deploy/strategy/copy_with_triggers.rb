require 'capistrano'
require 'capistrano/recipes/deploy/strategy/copy'

module Capistrano
  module Deploy
    module Strategy

      class CopyWithTriggers < Copy

        def initialize(config = {})
          super(config)
        end

        def deploy!
          logger.info "running Copy with triggers strategy.."
          copy_cache ? run_copy_cache_strategy : run_copy_strategy
          create_revision_file
          
          configuration.trigger('strategy:before:compression')
          logger.info "Compressing packaged app.."
          compress_repository
          configuration.trigger('strategy:after:compression')

          configuration.trigger('strategy:before:distribute')
          logger.info "Distributing packaged app.."
          distribute!
          configuration.trigger('strategy:after:distribute')
        ensure
          rollback_changes
        end

        def destinationrelease
	  return destination
	end

      end

    end
  end
end

