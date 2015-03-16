# Kaminari::Logarithmic

This plugin extends popular [kaminari](https://github.com/amatsuda/kaminari) gem to provide functionality for distributing big number of pages logarithmically. Such approach originally was  discussed [here](http://stackoverflow.com/questions/7835752/how-to-do-page-navigation-for-many-many-pages-logarithmic-page-navigation).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kaminari-logarithmic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaminari-logarithmic

## Usage

Do all the pagination stuff in controller and model usually. In your view use special helper instead of `paginate`:

```ruby
paginate_logarithmic @your_collection
```
By default even distribution strategy is used. You can specify strategy with `strategy` option:

```ruby
paginate_logarithmic @users, strategy: :fixed_steps
```
At the moment 2 strategies are available(TODO: describe both):

 1. `:even`.
 2. `:fixed_steps`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kaminari-logarithmic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
