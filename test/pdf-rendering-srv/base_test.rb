# frozen_string_literal: true

require "test_helper"

module PdfRenderingSrv
  class BaseTest < Minitest::Spec
    let(:pdf_rendering_srv_url) { "https://www.example.com" }
    let(:base) { Base.new }

    before do
      PdfRenderingSrv.configure do |config|
        config.pdf_rendering_srv_url = pdf_rendering_srv_url
      end
    end

    it { _(base.pdf_rendering_srv_url).must_equal pdf_rendering_srv_url }
  end
end
