# frozen_string_literal: true

# Jekyll 4 caches parsed Liquid by `document.path` (Jekyll::LiquidRenderer::File#parse uses
# `cache[filename] ||= parse(content)`). jekyll-paginate-v2's PaginationPage leaves `path` as
# ".html" for generated index pages, so multiple pagination templates share one cache entry and
# whichever page is parsed first wins — e.g. /tech/ can render misc.md's Liquid (wrong h1).
#
# Point `page.data["path"]` at the real source template so Liquid cache keys stay unique.
module Jekyll
  module PaginateV2
    module Generator
      class PaginationPage
        alias_method :pagination_page_orig_initialize, :initialize

        def initialize(page_to_copy, cur_page_nr, total_pages, index_pageandext)
          pagination_page_orig_initialize(page_to_copy, cur_page_nr, total_pages, index_pageandext)
          self.data["path"] = page_to_copy.path if page_to_copy&.path
        end
      end
    end
  end
end
