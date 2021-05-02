# frozen_string_literal: true

require "http"

module PdfRenderingSrv
  class FromUrl < PdfRenderingSrv
    attribute :url, Types::Coercible::String

    def response
      @response ||= HTTP.headers("content-type" => "application/json")
                        .post(pdf_rendering_srv_url, json: params.merge(url: url))
    end
  end
end
