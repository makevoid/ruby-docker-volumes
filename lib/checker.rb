class Checker

  # temp hosts:
  #
  # local docker hosts - ...

  HOSTS = %w(

    http://localhost:8000
    http://localhost:8001
    http://localhost:8002

  )

  def new#(hosts)
    # @hosts = hosts
    # ...
  end

  def check_all
    HOSTS.each do |host|
      check_host host
    end
  end

  def self.check_all
    new.check_all
  end


  # pseudo code:

  # def some_method
  #   check_hosts
  #   all
  # end
  #
  # def self.some_method!
  #   new.some_method
  # end

end




# implementation notes:
#
# --- --- --- --- --- --- ---
#
# # execution of some method on singleton class
#
#
# # checker = Checker.new
#
# checker = Checker.new
#
# checker.some_method
#
# # ---
#
# Checker.some_method
#
# # impl:
#
# # injected
# module ClassMethodsDef
#   def define_class_method(method_name, &block)
#     self.class.define_method :method_name do
#       block.call
#     end
#   end
# end
#
# class Checker
#   extend ClassMethodsDef
#   # ...
#
#   define_class_method :some_method
#
#   # which is the equivalent of:
#   def self.some_method
#     new.some_method
#   end
# end
#
# # ---
#
# checker = Checker.new
# checker.some_method
