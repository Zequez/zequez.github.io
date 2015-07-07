xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  # sitemap.resources.reject { |page| page.url =~ /\.ico|\.png|\.js|\.jpg|\.css|\.xml/ }.each { |page| p page.url }
  sitemap.resources.each { |page| p page.url }
  sitemap.resources.reject { |page| page.url =~ /\.ico|\.png|\.js|\.jpg|\.css|\.xml/ }.each do |page|
    xml.url do
      xml.loc "#{data.sitemap.url}#{page.url}"
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq page.data.changefreq || "monthly"
      xml.priority page.data.priority || "0.5"
    end
  end
end