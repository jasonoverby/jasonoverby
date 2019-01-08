# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

before do
  @title = 'JASON OVERBY'

  @nav_links = { 'bam'            => 'https://bam-lambda.com',
                 'github'         => 'http://github.com/jasonoverby',
                 'linkedin'       => 'http://www.linkedin.com/in/jasoncoverby/',
                 'email'          => 'mailto:j@jasonoverby.com',
                 'resume'         => 'images/JasonOverbyResume.pdf' }
end

helpers do
  def list_items_with_anchors(link_text_and_url)
    link_text_and_url.map do |name, url|
      "<li><a href='#{url}' target='_blank'>#{social(name)}</a></li>"
    end.join
  end

  def social(icon)
    "<img src='images/#{icon}.png' class='social-icon' />"
  end
end

get '/' do
  erb :home
end
