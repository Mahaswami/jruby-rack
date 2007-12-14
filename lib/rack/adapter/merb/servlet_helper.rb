require 'rack/adapter/servlet_helper'

module Rack
  module Adapter
    class MerbServletHelper < ServletHelper
      attr_reader :merb_env, :merb_root, :path_prefix

      def initialize(servlet_context = nil)
        super
        @merb_root = @servlet_context.getInitParameter 'merb.root'
        @merb_root ||= '/WEB-INF'
        @merb_root = @servlet_context.getRealPath @merb_root
        @merb_env = @servlet_context.getInitParameter 'merb.env'
        @merb_env ||= 'production'
        @path_prefix = @servlet_context.getInitParameter 'path.prefix'
      end
    end

  end
end