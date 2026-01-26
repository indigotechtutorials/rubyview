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

### Ruby on Rails

Works out of the box with Rails just add the gem to your app and then change your file extensions from `.html.erb` to `.view` 

example: `app/views/pages/home.view`

```ruby
header "Hello Ruby on Rails!"
text "This is rendered with RubyView"
```

The form helpers are available allowing you to write form code inside rubyview templates

```ruby
container do
  form_with url: "/comments" do |f|
    container class: "p-4 mb-4" do
      f.text_area :body
    end
    f.submit "Send comment"
  end
end
```

Known Bug: As of now you must wrap your form_with in a container or else it will remove all the other elements in the parent container. Not sure why for now something with Rails will look into later. Also text area is not being rendered so this is a big challenge I need to fix next to get form helpers working possible just creating my own methods... TODO[1]

### Custom helpers

To take things further you can define your own helper methods that allow you to render a component with custom classes included. 

To do this you can use the RubyView.add_helper_method function. To do this in rails you can create a rubyview initializer file: `config/initializers/rubyview.rb` 

```ruby
RubyView.add_helper_method :vertical do |content = '', **html_opts, &block|
  custom_classes = 'flex flex-col'
  html_opts[:class] = merge_classes(html_opts[:class], custom_classes)
  div(content, **html_opts, &block)
end
```

Now in your code you can use the helper vertical for styling content with flex column plus any additional options.

The `merge_classes` method is provided for convenience to allow you to add combine two class strings to allow additional classes along with the default ones.

Inside of your custom method you have all of the methods from RubyView available to you. All of the html tags, rubyview DSL helpers and others.

One helpful function is the format_html_opts which converts an object of key value pairs into html tag options for example

format_html_opts({ class: "class-1 class-2", id: "element-1" })
=> class="class-1 class-2" id="element-1"

This is automatically done when passing in options to a helper like container/div

