# frozen_string_literal: true

module PdfRenderingSrv
  class Base < Dry::Struct
    module Types
      include Dry.Types()
    end

    attribute :pdf_rendering_srv_url, Types::String.optional.default(PdfRenderingSrv.configuration.pdf_rendering_srv_url.freeze)

    attribute :format, Types::Coercible::Symbol.enum(*%i[html pdf png jpg jpeg]).optional.default(:pdf)
    attribute :jpeg_quality, Types::Coercible::Integer.optional.default(90)

    # @see https://github.com/alvarcarto/url-to-pdf-api#get-apirender

    attribute :emulate_screen_media, Types::Bool.optional.default(nil)
    attribute :scroll_page, Types::Bool.optional.default(nil)
    attribute :wait_for, Types::Coercible::String.optional.default(nil)

    attribute? :viewport do
      attribute :width, Types::Coercible::Integer.optional.default(nil)
      attribute :height, Types::Coercible::Integer.optional.default(nil)
      attribute :device_scale_factor, Types::Coercible::Integer.optional.default(2)
      attribute :is_mobile, Types::Bool.optional.default(nil)
      attribute :has_touch, Types::Bool.optional.default(nil)
      attribute :is_landscape, Types::Bool.optional.default(nil)
    end

    attribute? :goto do
      attribute :wait_until, Types::Coercible::String.enum(*%w[load networkidle0 networkidle2]).optional.default(nil)
      attribute :network_idle_timeout, Types::Integer.optional.default(nil)
    end

    attribute? :pdf do
      attribute :scale, Types::Coercible::Float.optional.default(nil)
      attribute :print_background, Types::Bool.optional.default(nil)
      attribute :landscape, Types::Bool.optional.default(nil)
      attribute :page_ranges, Types::Coercible::String.optional.default(nil)
      attribute :format, Types::Coercible::String.optional.default(nil)
      attribute :width, Types::Coercible::String.optional.default(nil)
      attribute :height, Types::Coercible::String.optional.default(nil)
      attribute :margin_top, Types::Coercible::String.optional.default(nil)
      attribute :margin_right, Types::Coercible::String.optional.default(nil)
      attribute :margin_bottom, Types::Coercible::String.optional.default(nil)
      attribute :margin_left, Types::Coercible::String.optional.default(nil)
    end

    attribute? :screenshot do
      attribute :full_page, Types::Bool.optional.default(nil)
      attribute :omit_background, Types::Bool.optional.default(nil)
      attribute :clip_x, Types::Coercible::Integer.optional.default(nil)
      attribute :clip_y, Types::Coercible::Integer.optional.default(nil)
      attribute :clip_width, Types::Coercible::Integer.optional.default(nil)
      attribute :clip_height, Types::Coercible::Integer.optional.default(nil)
      attribute :selector, Types::Coercible::String.optional.default(nil)
    end

    def self.call(*args)
      new(*args).response
    end

    def response
      raise NotImplementedError
    end

    def params
      to_h.except(*%i[format jpeg_quality pdf_rendering_srv_url]).deep_merge(
        output: output,
        screenshot: {
          type: screenshot_type,
          quality: screenshot_quality
        }
      ).deep_transform_keys { |k| k.to_s.camelcase.tap { |str| str[0] = str[0].downcase }.to_sym }
       .reject { |_, v| v.nil? }
       .transform_values do |v|
        case v
        when Hash then v.reject { |_, val| val.nil? }
        else v
        end
      end
    end

    private
      def output
        case format
        when :html then :html
        when :pdf then :pdf
        when :png, :jpg, :jpeg then :screenshot
        else nil
        end
      end

      def screenshot_type
        case format
        when :png then :png
        when :jpg, :jpeg then :jpeg
        else nil
        end
      end

      def screenshot_quality
        case format
        when :jpg, :jpeg then jpeg_quality
        else nil
        end
      end
  end
end
