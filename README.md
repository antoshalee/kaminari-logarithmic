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

**Important**

 Currently you will not see any changes if you use default kaminari views. To make it work you should customize views.

1. First you should generate partials in `app/views/kaminari` folder (skip if you did that earlier):

    ```ruby
    rails g kaminari:views default
    ```
More details and options on [kaminari documentation page](https://github.com/amatsuda/kaminari).
2.  Assuming you generated views in `erb` format find following lines in  _paginator.erb partial:

    ```ruby
    <% if page.left_outer? || page.right_outer? || page.inside_window? -%>
      <%= page_tag page %>
    ```

3.  Add special condition (or supply your custom logic) :
    ```
    page.logarithmic_page?
    ```
  Example:
    ```ruby
    <% if page.left_outer? || page.right_outer? || page.inside_window? || page.logaritmic_page? -%>
      <%= page_tag page %>
    ```

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
