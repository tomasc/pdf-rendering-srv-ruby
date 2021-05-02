# frozen_string_literal: true

require "test_helper"

module PdfRenderingSrv
  class FromUrlTest < Minitest::Spec
    let(:url) { "https://example.com" }

    it "returns PDF by default" do
      VCR.use_cassette("from_url") do
        @response = FromUrl.call(url: url)

        _(@response.status).must_be :success?
        _(@response.mime_type).must_equal "application/pdf"
        _(@response.content_length).must_equal 35878
      end
    end

    it "returns HTML" do
      VCR.use_cassette("from_url/html") do
        @response = FromUrl.call(url: url, format: :html)

        _(@response.status).must_be :success?
        _(@response.mime_type).must_equal "text/html"
        _(@response.content_length).must_equal 294
        _(@response.body.to_s).must_include "<h1>Example Domain</h1>"
      end
    end

    it "returns PNG" do
      VCR.use_cassette("from_url/png") do
        @response = FromUrl.call(url: url, format: :png)

        _(@response.status).must_be :success?
        _(@response.mime_type).must_equal "image/png"
        _(@response.content_length).must_equal 35303
      end
    end

    it "returns JPG" do
      VCR.use_cassette("from_url/jpg") do
        @response = FromUrl.call(url: url, format: :jpg)

        _(@response.status).must_be :success?
        _(@response.mime_type).must_equal "image/jpeg"
        _(@response.content_length).must_equal 36849
      end
    end
  end
end
