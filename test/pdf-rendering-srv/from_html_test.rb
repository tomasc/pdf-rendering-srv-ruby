# frozen_string_literal: true

require "test_helper"

module PdfRenderingSrv
  class FromHtmlTest < Minitest::Spec
    # TODO: mock these with VCR

    # let(:format) { nil }
    # let(:html) { "<html><head><title>Hello</title></head><body>Hello</body></html>" }
    # let(:service) { FromHtml.new(html: html, format: format) }
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

    # FIXME: only PDF output seems to work

    # describe "HTML" do
    #   let(:format) { :html }
    #
    #   before do
    #     @status, @headers, @body = service.response.to_a
    #   end
    #
    #   it { _(@body).must_include "<title>Hello</title>" }
    #   it { _(service.response.mime_type).must_equal "text/html" }
    # end

    # describe "PDF" do
    #   let(:format) { :pdf }
    #
    #   it { _(service.response.mime_type).must_equal "application/pdf" }
    # end

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
