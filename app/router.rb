require "roda"

class Router < Roda

  route do |r|
    r.root do
      "hello world!"
    end
  end
end
