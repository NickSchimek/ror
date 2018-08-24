# Ror
#### Finally the Ror gem is here!

A CLI tool that displays required and optional parameters for rails methods. This is not a replacement for actual Rails documentation, but rather to make it more convenient to quickly look up a method's syntax & parameters along with some general/important info, and a link to the Rails method documentation!

Why might this be useful? If your a full-time rails developer you may not need this, but individuals who develop as a hobby or newcomers to the language might find this CLI fast and easy to use so that they can get on coding and spend less time navigating a browser! or [dash](https://kapeli.com/dash) or [devdocs](https://devdocs.io/) which are great tools! and come highly recommended.

Currently the ror CLI contains very few methods (if any at all) as method information is not pulled from any online resource since it is 100% manual entry. It is this way for one main reason, and that is so that any individual who wishes to contribute (including yours truly) can learn about rails methods (by teaching through writing) while contributing to a gem.

I feel the most can be gained when the user tries to recall the syntax/parameters for a method, before using this tool. The more that is done the sooner the brain will believe the information is important.

Please visit and dive deep into the [Rails guide and documentation](http://guides.rubyonrails.org/). If you find this useful and would like to contribute please see [Contributing](#contributing).

## Installation

This is currently not published, but if you wish to install it.

Fork, and clone the repo.

Then run:
```
    $ rake build
    > ror 0.1.0 built to pkg/ror-0.1.0.gem.
```
copy the files output location and run
```
    $ gem install pkg/ror-0.1.0.gem
```

You can then follow the usage guidelines below.

## Usage

Run:
```
    $ ror info 'method_name'
```
which will either display the information for the method or if the method is used in multiple classes then it will give you a choice of which classes you can choose from.

If you know which class you want to look at add it in like this:
```
    $ ror info 'method_name' 'class'
```

Here are some examples.
```
    $ ror info render
```

Which displays:
```
Multiple classes contain the render method.
  For: Actionview type 'view' or 'v'
  For: Actioncontroller type 'controller' or 'c'

-> Please choose a class for the render method?
```

If you know the class then append it in at the end:
```
    $ ror info render actionview
```
You can also use `view` or `v` as an alias for actionview.

Likewise you can use the alias `controller` or `c` for actioncontroller.
```
    $ ror info render c
```

The method information is displayed the same way man pages are. That way the output doesn't clutter the terminal.

## <a name="contributing"></a>Contributing

Fork, clone, and bundle. Then run `rake test` to run the tests.

This gem comes with a generator to add new method descriptions.
Simply run:
```
    $ ror new_method [method name] [class1 class2 ...]
```

### Examples:
#### 1:
I want to add the `partial` method wich is used in views under the `Actionview` class.
Then I run:
```
    $ ror new_method partial actionview
```
And it generates the template, and other necessary code for it to work.

Then update the generated template with information on the partial method. And do a pull request.

#### 2:
I want to add the `render` method which is used in controllers and views.
Then I run:
```
    $ ror new_method render actionview actioncontroller
```
It automatically creates the template, and generates necessary code for it to run.

Then update both templates.

The templates will be located in `lib/ror/method_descriptions` under the corresponding class folder name.

In you wish to test or use the new methods right away then the gem will need to be reinstalled by doing `rake build` and then the gem install command on the output file provided by rake build.

Bug reports and pull requests are welcome on GitHub at https://github.com/NickSchimek/ror.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
