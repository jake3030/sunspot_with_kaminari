# module SunspotWithKaminari
# end

module Sunspot
  module Search
    class AbstractSearch

      # ==== Returns
      #
      # Integer:: Current page number
      #
      def current_page
        @query.page
      end
  
      # ==== Returns
      #
      # Integer:: Total number of pages for matching documents
      #
      def num_pages
        (total.to_f / @query.per_page).ceil
      end
  
      # ==== Returns
      #
      # Integer:: Number of records displayed per page
      #
      def limit_value
        @query.per_page
      end
      
      def empty?
        total == 0
      end
      
      def any?
        total > 0
      end
      
      
      private
      
      def maybe_will_paginate(collection)
        if defined?(WillPaginate::Collection)
          WillPaginate::Collection.create(@query.page, @query.per_page, total) do |pager|
            pager.replace(collection)
          end
        elsif defined?(Kaminari::PaginatableArray)
          PaginatableArray.initialize_paginated_array(collection, @query.per_page, @query.page, total)
        else
          collection
        end
      end
    end
  end
end

module Kaminari
  # Kind of Array that can paginate
  class PaginatableArray < Array
    
    def set_total(total)
      @_total = total
    end
    
    # total item numbers of the original array
    def total_count
      @_total || @_original_array.count
    end
  end

  # Wrap an Array object to make it paginatable
  def self.initialize_paginated_array(arr, limit_val = default_per_page, offset_val = 0, total = nil) #:nodoc:
    arr = PaginatableArray.new(arr, limit_val, offset_val)
    arr.set_total(total)
    arr
  end
  
end
