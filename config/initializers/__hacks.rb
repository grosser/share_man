# ActionView text helpers
# http://grosser.it/2009/05/30/all-actionview-helpers-on-strings/
class String
  %w[auto_link excerpt highlight sanitize simple_format strip_tags word_wrap].each do |method|
    define_method method do |*args|
      ActionController::Base.helpers.send method, self, *args
    end
  end

  def truncate(*args)
    if args.first.is_a?(Hash)
      ActionController::Base.helpers.truncate(self, *args)
    else
      ActionController::Base.helpers.truncate(self, :length=>args[0])
    end
  end
end

# http://stackoverflow.com/questions/4191028/rails-3-0-2-arrayjoin-html-safe/7768339#7768339
class Array
  def html_safe_join(delimiter='')
    ''.html_safe.tap do |str|
      each_with_index do |element, i|
        str << delimiter if i > 0
        str << element
      end
    end
  end
end

module Kernel
  def seeded_rand(seed, *args)
    Random.new(seed).rand(*args)
  end
end
