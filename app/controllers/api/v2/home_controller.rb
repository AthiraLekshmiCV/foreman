module Api
  module V2
    class HomeController < V2::BaseController
      before_filter :require_admin

      api :GET, "/", "Show available links."

      def index
        # we need to load apipie documentation to show all the links.
        Apipie.reload_documentation if Apipie.configuration.reload_controllers?
      end

      api :GET, "/status/", "Show status."

      def status
      end

      def route_error
        render_error 'route_error', :status => :not_found
      end

    end
  end
end
