# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

before do
  @title = 'JASON OVERBY'
  @nav_links = { 'git'            => 'http://github.com/jasonoverby',
                 'linkedin'       => 'http://www.linkedin.com/in/jasoncoverby/',
                 'resume'         => 'images/JasonOverbyResume2018.pdf',
                 'email'          => 'mailto:j@jasonoverby.com' }
end

helpers do
  def list_items_with_anchors(link_text_and_url)
    link_text_and_url.map do |name, url|
      "<li><a href='#{url}' target='_blank'>#{name}</a></li>"
    end.join
  end
end

get '/' do
  erb :home
end
