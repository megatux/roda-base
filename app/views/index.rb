class Index < Phlex::HTML
  def initialize(items:) = @items = items

  def template
    render Layout.new(title: "Phlex/Roda Example CRUD") do
      h1 class: "text-3xl font-bold" do
        "Movies to see"
      end

      render Index::List.new(items: @items)
    end
  end

  class List < Phlex::HTML
    def initialize(items:) = @items = items

    def template
      ul(class: "mt-4 px-4 border border-solid rounded border-green-800") {
        @items.each { |item| render ListItem.new(item: item) }
      }
    end
  end

  class ListItem < Phlex::HTML
    def initialize(item:)
      @item = item
    end

    def template
      li(class: "list-disc mt-2 border-2 border-solid border-grey-200",
        "hx-target": "this", "hx-swap": "outerHTML") {
        label { "ID: " }
        span { @item.id }
        span { " - " }
        label { "Title: " }
        span { @item.title }

        button(class: "text-right p-1 m-4 border-solid border rounded",
          "hx-get": "/movie/edit/#{@item.id}",
          "hx-trigger": "click") do
          "Change Title"
        end
      }
    end
  end
end
