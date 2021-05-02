# frozen_string_literal: true

require "test_helper"

module PdfRenderingSrv
  class BaseTest < Minitest::Spec
    let(:base) { Base.new }

    it { _(base.pdf_rendering_srv_url).must_equal "http://localhost:9000/api/render" }
  end
end
