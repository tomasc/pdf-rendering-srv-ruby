# frozen_string_literal: true

module PdfRenderingSrv
  class Configuration
    attr_accessor :pdf_rendering_srv_url

    def initialize
      @pdf_rendering_srv_url = "http://localhost:9000/api/render"
    end
  end
end
