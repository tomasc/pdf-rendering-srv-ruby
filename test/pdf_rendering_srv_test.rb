# frozen_string_literal: true

require "test_helper"

class PdfRenderingSrvTest < Minitest::Spec
  it { _(PdfRenderingSrv::VERSION).wont_be :nil? }
end
