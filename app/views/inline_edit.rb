class InlineEdit < Phlex::HTML
  def initialize(item:)
    @item = item
  end

  def template
    form("hx-put": "/movie/edit/#{@item.id}", "hx-target": "this", "hx-swap": "outerHTML") {
      div(class: "mt-2 border-2 border-dashed border-green-400") {
        span { "#{@item.id}:" }
        input type: "hidden", name: "id", value: @item.id
        label { "Title:" }
        input type: "text", name: "title", value: @item.title, class: ::Styles.input_text

        button(class: ::Styles.submit_btn) { "Submit" }
        button(class: ::Styles.cancel_btn, "hx-get": "/movie/#{@item.id}") { "Cancel" }
      }
    }
  end
end
