# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://citycareerlab.com"
SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'daily'
  add about_path, changefreq: 'daily'
  add '/#consultation', changefreq: 'daily'
  add products_and_services_path, changefreq: 'daily'
  add faq_path, changefreq: 'daily'
  add media_path, changefreq: 'daily'
  add '/#contact', changefreq: 'daily'
  add terms_and_conditions_path, changefreq: 'daily'
  add privacy_policy_path, changefreq: 'daily'

  add blog_path, changefreq: 'daily'
  Post.sitemap.find_each do |article|
    add blog_show_path(article), lastmod: article.updated_at, changefreq: 'daily'
  end
end