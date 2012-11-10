# Bickle

Bickle is a tool to display your build status from your terminal.

## Installation

Add this line to your application's Gemfile:

    gem "bickle"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bickle

## Usage

### Display last builds of a repository

```
$ bickle rails/rails
```

- Use `-n x` to limit the number of builds to `x`
- Use `--extend-fails` to display additional details under builds that failed.

### Display details about particular build

```
$ bickle rails/rails/3139202
```

```
$ bickle 3139202
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
