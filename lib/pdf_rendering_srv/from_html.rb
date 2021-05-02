# frozen_string_literal: true

require "http"

module PdfRenderingSrv
  class FromHtml < Base
    attribute :html, Types::Coercible::String

    def response
      @response ||= HTTP.headers("content-type" => "text/html")
                        .post(pdf_rendering_srv_url, body: html, json: params)
    end
  end
end
