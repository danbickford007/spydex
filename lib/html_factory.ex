defmodule HtmlFactory do

  def simple do
    """
      <html>
        <head>
          <title>danbickford.me</title>
        </head>
        <body>
          <a href="test">test</a>
          <h1>foo</h1>
          <a onclick='tester'>tester</a>
          <h1 style='color:black'>foo</h1>
        </body>
      </html>
    """
  end

end
