class Layout < Phlex::HTML
  def initialize(title:)
    @title = title
  end

  def template(&)
    doctype
    head_template

    body(class: rounded_spaced_style + "border-red-800") {
      div(class: rounded_spaced_style + "border-blue-800") {
        div(class: rounded_spaced_style + "border-grey-800") {
          yield_content(&)
        }
      }
      footer(class: "bg-gray-200") { copy_msg }
    }
  end

  def head_template
    head do
      title { @title }
      script src: "https://cdn.tailwindcss.com"
      script src: "https://unpkg.com/htmx.org@1.9.5",
        integrity: "sha384-xcuj3WpfgjlKF+FXhSQFQ0ZNr39ln+hwjN3npfM9VBnUskLolQAcN80McRIVOPuO",
        crossorigin: "anonymous"
    end
  end

  private

  def copy_msg
    "Copyright #{Date.today.year} - All rights reserved"
  end

  def rounded_spaced_style
    "m-4 border-solid border rounded "
  end
end
