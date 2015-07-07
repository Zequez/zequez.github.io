activate :directory_indexes
activate :syntax#, line_numbers: true

###
# Blog settings
###

# # Time.zone = "UTC"
activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "{year}/{month}/{day}/{title}"
  # Matcher for blog source files
  blog.taglink = "tag/{tag}"
  blog.layout = "blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = "{year}"
  blog.month_link = "{year}/{month}"
  blog.day_link = "{year}/{month}/{day}"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  blog.paginate = false
  # blog.per_page = 10
  # blog.page_link = "page/{num}"

  blog.sources = "articles/{year}-{month}-{day}-{title}.html"
end

page "/feed.xml", layout: false
page "/sitemap.xml", layout: false
# proxy "/about-me", "/about-me.html"
# ignore "/about-me.html"

# # compass_config do |config|
# #   config.output_style = :compact
# # end

data.store :projects_hash, Hash[data.projects.map{|k,v| [k.sub(/^\d+\-/, ''), v]}]
data.store :projects_list, data.projects.values.reverse
data.projects_list.each do |project|
  proxy "/projects/#{project.tag}", '/projects/template.html', locals: { project: project }
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload, no_swf: true, host: '127.0.0.1'#, port: 9292

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 10']
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true
set :haml, { ugly: true }

sprockets.append_path File.join root, 'bower_components'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end