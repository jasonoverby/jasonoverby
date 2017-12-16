# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

before do
  @title = 'JASON OVERBY'
  being_being_logo = '<img class="being-being letters"
                           src="images/beingbeinglogo.png"
                           alt="The Being Being" />'

  @nav_links = { 'artwork'        => '/',
                 'comics'         => 'comics',
                 being_being_logo => 'thebeingbeing',
                 'git'            => 'http://github.com/jasonoverby',
                 'linkedin'       => 'http://www.linkedin.com/in/jasoncoverby/',
                 'email'          => 'mailto:jason.c.overby@gmail.com' }
end

helpers do
  def image_files(directory)
    files = Dir.entries("public/images/#{directory}")[2..-1]

    alt_text = files.map do |filename|
      filename.gsub(/^\d{2}/, '').tr('_', ' ')
              .gsub(/(.jpg|.png)/, '').split.map(&:capitalize).join(' ')
    end.join(', ')

    { files: files.join(', '), alt_text: alt_text }
  end

  def gallery(directory)
    files_images = image_files(directory)

    files = files_images[:files].split(', ')
    alt_text = files_images[:alt_text].split(', ')
    images = Hash[files.zip(alt_text)]

    images.map do |filename, alt|
      "<img src='/images/#{directory}/#{filename}' alt='#{alt}' />"
    end.join
  end

  def list_items_with_anchors(link_text_and_url)
    link_text_and_url.map do |name, url|
      target = ' target=blank' if url.include?(':')
      "<li><a href='#{url}'#{target}>#{name}</a></li>"
    end.join
  end
end

get '/' do
  @art = image_files('art')
  @first_artwork = {}
  @first_artwork[:name] = @art[:files].split(',').first
  @first_artwork[:alt] = @art[:alt_text].split(',').first

  erb :home
end

get '/comics' do
  wordpress = 'http://disguisekit.files.wordpress.com'
  comics_titles = ['2101',
                   'Solipsist\'s Doodles',
                   'Compression',
                   'Shark',
                   'Yoko Ono in the Curse of Hall Hassi',
                   'Obligatory Artifact',
                   'Still Life with Kanye West']

  comics_links = ['http://twentyonezeroone.com',
                  "#{wordpress}/2009/06/readsolipsist.pdf",
                  "#{wordpress}/2012/11/compression-1-2.pdf",
                  "#{wordpress}/2010/07/shark.pdf",
                  "#{wordpress}/2011/10/yokoono.pdf",
                  "#{wordpress}/2010/12/readobligatoryartifact.pdf",
                  "#{wordpress}/2011/09/stilllifewithkanyewest2.pdf"]

  @comics = Hash[comics_titles.zip(comics_links)]

  erb :comics
end

get '/thebeingbeing' do
  @directory = 'thebeingbeing'
  erb :thebeingbeing
end
