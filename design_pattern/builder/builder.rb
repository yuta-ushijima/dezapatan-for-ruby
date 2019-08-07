class DocumentBuilder
  attr_accessor :setTitle, :setHeader, :setBody, :setFooter

    def set_body(body)
        raise "Override this method!"
    end
    
    def set_footer(footer)
      raise "Override this method!"
    end
      
    def set_header(header)
      raise "Override this method!"
    end
      
    def set_title(title)
      raise "Override this method!"
    end
end

class HtmlBuilder < DocumentBuilder

  # NOTE: わかりやすく明示的にselfを使用
  def set_body(body)
    self.setBody = body
  end

  def set_footer(footer)
    self.setFooter = footer
  end
  
  def set_header(header)
    self.setHeader = header
  end
  
  def set_title(title)
    self.setTitle = title
  end

  def result
    puts <<~HTML
        <html>
          <head><title>#{self.setTitle}</title></head>
          <body>
            <h1>#{self.setHeader}</h1>
            <div><p>#{self.setBody}</p></div>
            <hr />
            <div>#{self.setFooter}</div>
          </body>
        </html>
    HTML
  end
end

class ReportDirecotr
    def initialize(builder)
        @builder = builder
    end
    
    def build
        @builder.set_title("キャハハッ！報告書だよ！")
        @builder.set_header("失敗した失敗した失敗した")
        @builder.set_body("プロトタイプたんをムダにしちゃいました！")
        @builder.set_footer("次がんばろ〜")
    end
end

builder = HtmlBuilder.new
director = ReportDirecotr.new(builder)
director.build
puts builder.result

