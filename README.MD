# Ruby view

an alternative to HTML & ERB

write your files using ruby

Create a ruby file: `hello.rb`


hello.rb
```ruby
header "Hello World!"
```

Now in terminal you can run this command to get HTML

`rubyview render hello.rb`

or inside of a ruby file

```ruby
require 'rubyview'
RubyView.render("hello.rb")
```

You will see the following html be rendered

`<h1>Hello World!</h1>`

Example:

