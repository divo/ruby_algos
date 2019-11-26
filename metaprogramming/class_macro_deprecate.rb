class Example
  def new_method; puts 'new!'; end

  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated, use #{new_method}()"
      send(new_method, *args, &block)
    end
  end

  deprecate :old_method, :new_method
end

exp = Example.new
exp.new_method
exp.old_method
