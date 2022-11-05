require "sanitize"

class Page
  def self.save(body, name: 'index.html', bypass_html: false)
    body = Sanitize.fragment(body) unless bypass_html
    File.open(name, "w+") do |i|
      html = <<~HTML
        <!DOCTYPE HTML>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>#{name}</title>
        </head>
        <body>
            <div class="info">
                #{body}
            </div>
        </body>
        </html>
      HTML
      i.write(html)
    end
  end
end
