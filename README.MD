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

### Syntax

There are two correct ways to write rubyview code. 1 is using the html tag names directly this means you can directly write the html tags in ruby.

```ruby
h1 "Hello world!"
p  "say whats up"
```

The other way is to use the custom DSL I built to abstract away from regular html tag names to other rememberable names.

```ruby
header "Hello world!"
text  "say whats up"
```

Here is a full list of the custom DSL names mapped to the corresponding html tag

| DSL Method | HTML Method |
|------------|-------------|
| header     | h1          |
| text       | p           |
| container  | div         |