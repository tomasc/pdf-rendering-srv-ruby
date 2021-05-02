# frozen_string_literal: true

require "test_helper"

module PdfRenderingSrv
  class FromUrlTest < Minitest::Spec
    # TODO: mock these with VCR

    # let(:format) { nil }
    # let(:url) { "https://example.com" }
    # let(:service) { FromUrl.new(url: url, format: format) }
    #
    # it "#response" do
    #   _(service.response.code).must_equal 200
    #   _(service.response.mime_type).must_equal "application/pdf"
    # end
    #
    # describe "#response" do
    #   before do
    #     @status, @headers, @body = service.response.to_a
    #   end
    #
    #   it "sets status, headers and body" do
    #     _(@status).must_equal 200
    #     _(@headers.keys).must_include "Content-Type"
    #     _(@headers.keys).must_include "Content-Length"
    #     _(@body).must_be :present?
    #   end
    # end
    #
    # describe "HTML" do
    #   let(:format) { :html }
    #
    #   before do
    #     @status, @headers, @body = service.response.to_a
    #   end
    #
    #   it { _(@body).must_include "<h1>Example Domain</h1>" }
    #   it { _(service.response.mime_type).must_equal "text/html" }
    # end
    #
    # describe "PDF" do
    #   let(:format) { :pdf }
    #
    #   it { _(service.response.mime_type).must_equal "application/pdf" }
    # end
    #
    # describe "PNG" do
    #   let(:format) { :png }
    #
    #   it { _(service.response.mime_type).must_equal "image/png" }
    # end
    #
    # describe "JPG" do
    #   let(:format) { :jpg }
    #
    #   it { _(service.response.mime_type).must_equal "image/jpeg" }
    # end
  end
end
