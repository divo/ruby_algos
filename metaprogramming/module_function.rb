module A
  def pub
    'pub'
  end
  module_function :pub

  private

  def pri
    'pri'
  end
  module_function :pub
end

# These methods are available on the Modules singleton, but private on any instances that use the Module
class Test
  include A
end
