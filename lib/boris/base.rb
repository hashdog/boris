require "rack"

module Boris
  class Base
    def initialize
      @routes = {}
    end

    attr_reader :routes, :request

    %w(DELETE GET HEAD OPTIONS PATCH POST PUT).each do |verb|
      define_method(verb.downcase) { |path, &handler|
        route verb, path, &handler
      }
    end

    def call(env)
      @request = Rack::Request.new(env)

      handler = @routes.fetch(@request.request_method, {}).
                        fetch(@request.path_info, nil)

      if handler
        result = instance_eval(&handler)
        if result.class.name.is_a?(String)
          [200, {}, [result]]
        else
          result
        end
      else
        [404, {}, ["Oops!, No route for #{@request.request_method} #{@request.path_info}"]]
      end
    end

    def params
      @request.params
    end

    private

    def route(verb, path, &handler)
      @routes[verb] ||= {}
      @routes[verb][path] = handler
    end
  end

  Application = Base.new
end
