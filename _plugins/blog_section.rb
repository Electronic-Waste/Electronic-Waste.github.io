# frozen_string_literal: true

# Syncs `blog_section` from each post's front matter into `categories` so
# jekyll-paginate-v2 can filter with `category: tech` / `category: misc`.
# Set in front matter: blog_section: tech   or   blog_section: misc
module Jekyll
  class BlogSectionCategories < Generator
    safe true
    priority :high

    def generate(site)
      posts = site.collections["posts"]&.docs
      return unless posts

      posts.each do |post|
        section = post.data["blog_section"]
        next if section.nil? || section.to_s.strip.empty?

        cats = post.data["categories"]
        cats = cats.nil? ? [] : [cats].flatten.compact
        cats << section unless cats.include?(section)
        post.data["categories"] = cats
      end
    end
  end
end
