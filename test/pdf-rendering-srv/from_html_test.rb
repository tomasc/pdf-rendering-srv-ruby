# frozen_string_literal: true

require "test_helper"

module PdfRenderingSrv
  class FromHtmlTest < Minitest::Spec
    let(:html) { "<html><head><title>Hello</title></head><body>Hello</body></html>" }

    it "returns PDF by default" do
      VCR.use_cassette("from_html") do
        @response = FromHtml.call(html: html)

        _(@response.status).must_be :success?
        _(@response.mime_type).must_equal "application/pdf"
        _(@response.content_length).must_equal 11469
      end
    end

    # FIXME: only PDF output seems to work
    # it "returns PNG" do
    #   VCR.use_cassette("from_html/png") do
    #     @response = FromHtml.call(html: html, format: :png)
    #
    #     _(@response.status).must_be :success?
    #     _(@response.mime_type).must_equal "image/png"
    #     _(@response.content_length).must_equal 11469
    #   end
    # end
  end
end
