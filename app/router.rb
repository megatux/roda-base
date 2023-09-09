require "roda"
require "phlex"
require "htmx"

require "byebug"

class Router < Roda
  plugin :all_verbs

  route do |r|
    r.root do
      Index.new(items: Movies.all).call
    end

    r.is "movie", Integer do |id|
      item = Movies.all.first { |e| e.id == id }
      r.get { Index::ListItem.new(item: item).call }
    end

    r.is "movie/edit", Integer do |id|
      item = Movies.all.first { |e| e.id == id }

      r.get { InlineEdit.new(item: item).call }

      r.put do
        item.title = r.params["title"]
        Index::ListItem.new(item: item).call
      end
    end
  end
end
