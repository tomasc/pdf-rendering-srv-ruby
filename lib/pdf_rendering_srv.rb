# frozen_string_literal: true

require "pdf_rendering_srv/version"

require "active_support/core_ext/hash"

require "dry-struct"
require "dry-types"
require "http"
require "zeitwerk"

module PdfRenderingSrv
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir("#{__dir__}/pdf_rendering_srv", namespace: PdfRenderingSrv)
  loader.setup
end
