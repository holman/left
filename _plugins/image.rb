# Image Tag
#
# Easily put an image into a Jekyll page or blog post
#
# Examples:
#   Input:
#     {% image http://path/to/image.png %}
#   Output:
#      <figure>
#        <img src='http://path/to/image.png'>
#      </figure>
#
#   Input:
#     {% image full http://path/to/image.png %}
#   Output:
#      <figure class='full'>
#        <img src="http://path/to/image.png">
#      </figure>
#
#   Input:
#     {% image http://path/to/image.png "Image caption" %}
#   Output:
#      <figure>
#        <img src="http://path/to/image.png">
#        <figcaption>Image caption</figcaption>
#      </figure>
#
#   Input:
#     {% image full http://path/to/image.png "Image caption" %}
#   Output:
#      <figure class='full'>
#        <img src="http://path/to/image.png">
#        <figcaption>Image caption</figcaption>
#      </figure>
module Jekyll
  class ImageTag < Liquid::Tag
    @url = nil
    @caption = nil
    @class = nil

    IMAGE_URL_WITH_CLASS_AND_CAPTION = /(\w+)(\s+)((https?:\/\/|\/)(\S+))(\s+)"(.*?)"/i
    IMAGE_URL_WITH_CAPTION = /((https?:\/\/|\/)(\S+))(\s+)"(.*?)"/i
    IMAGE_URL_WITH_CLASS = /(\w+)(\s+)((https?:\/\/|\/)(\S+))/i
    IMAGE_URL = /((https?:\/\/|\/)(\S+))/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ IMAGE_URL_WITH_CLASS_AND_CAPTION
        @class   = $1
        @url     = $3
        @caption = $7
      elsif markup =~ IMAGE_URL_WITH_CAPTION
        @url     = $1
        @caption = $5
      elsif markup =~ IMAGE_URL_WITH_CLASS
        @class = $1
        @url   = $3
      elsif markup =~ IMAGE_URL
        @url = $1
      end
    end

    def render(context)
      if @class
        source = "<figure class='#{@class}'>"
      else
        source = "<figure>"
      end

      source += "<img src=\"#{@url}\">"
      source += "<figcaption>#{@caption}</figcaption>" if @caption
      source += "</figure>"

      source
    end
  end
end

Liquid::Template.register_tag('image', Jekyll::ImageTag)