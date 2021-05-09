# frozen_string_literal: true

module PdfRenderingSrv
  class Base < Dry::Struct
    module Types
      include Dry.Types()
    end

    transform_keys(&:to_sym)

    attribute :pdf_rendering_srv_url, Types::String.optional.default(PdfRenderingSrv.configuration.pdf_rendering_srv_url.freeze)

    attribute :format, Types::Coercible::Symbol.enum(*%i[html pdf png jpg jpeg]).optional.default(:pdf)
    attribute? :jpeg_quality, Types::Coercible::Integer.optional.default(90)

    # @see https://github.com/alvarcarto/url-to-pdf-api#get-apirender

    attribute? :emulate_screen_media, Types::Bool.optional
    attribute? :scroll_page, Types::Bool.optional
    attribute? :wait_for, Types::Coercible::String.optional

    attribute? :viewport do
      attribute? :width, Types::Coercible::Integer.optional
      attribute? :height, Types::Coercible::Integer.optional
      attribute? :device_scale_factor, Types::Coercible::Integer.optional.default(2)
      attribute? :is_mobile, Types::Bool.optional
      attribute? :has_touch, Types::Bool.optional
      attribute? :is_landscape, Types::Bool.optional
    end

    attribute? :cookies, Types::Array do
      attribute :name, Types::String
      attribute :value, Types::String
      attribute? :url, Types::String.optional
      attribute? :domain, Types::String.optional
      attribute? :path, Types::String.optional
      attribute? :expires, Types::Coercible::Integer.optional
      attribute? :http_only, Types::Bool.optional
      attribute? :secure, Types::Bool.optional
      attribute? :same_site, Types::String.optional
    end

    attribute? :goto do
      attribute? :wait_until, Types::Coercible::String.enum(*%w[load networkidle0 networkidle2]).optional
      attribute? :network_idle_timeout, Types::Integer.optional
    end

    attribute? :pdf do
      attribute? :scale, Types::Coercible::Float.optional
      attribute? :print_background, Types::Bool.optional
      attribute? :landscape, Types::Bool.optional
      attribute? :page_ranges, Types::Coercible::String.optional
      attribute? :format, Types::Coercible::String.optional
      attribute? :width, Types::Coercible::String.optional
      attribute? :height, Types::Coercible::String.optional
      attribute? :margin do
        attribute? :top, Types::Coercible::String.optional
        attribute? :right, Types::Coercible::String.optional
        attribute? :bottom, Types::Coercible::String.optional
        attribute? :left, Types::Coercible::String.optional
      end
    end

    attribute? :screenshot do
      attribute? :full_page, Types::Bool.optional
      attribute? :omit_background, Types::Bool.optional
      attribute? :clip do
        attribute? :x, Types::Coercible::Integer.optional
        attribute? :y, Types::Coercible::Integer.optional
        attribute? :width, Types::Coercible::Integer.optional
        attribute? :height, Types::Coercible::Integer.optional
      end
      attribute? :selector, Types::Coercible::String.optional
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
