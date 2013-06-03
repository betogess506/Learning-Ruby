module Trace
  def self.included(culprit)
    #Inject existing methods with tracing code:
    culprit.instance_methods(false).each do |func|
      inject(culprit, func)
    end

    #Override the singletons method_added to ensure all future methods are injected.
    def culprit.method_added(meth)
      unless @trace_calls_internal
        @trace_calls_internal = true
        Trace.inject(self, meth) #This will call method_added itself, the condition prevents infinite recursion.
        @trace_calls_internal = false
      end 
    end
  end

  def self.inject(target, meth)
    target.instance_eval do
      #Get the method
      method_object = instance_method(meth)
      #Rewrite dat sheet
      define_method(meth) do |*args, &block|
        puts "==> Called #{meth} with #{args.inspect}"
        #the bind to self will put the context back to the class.
        result = method_object.bind(self).call(*args, &block)
        puts "<== #{meth} returned #{result.inspect}"
        result
      end
    end
  end
en

class Example
  def one(arg)
    puts "One called with #{arg}"
  end
end
#No tracing for the above.
ex1 = Example.new
ex1.one("Sup")

class Example #extend the class to include tracing.
  include Trace
  def two(a1, a2)
    a1 + a2
  end
end

ex1.one("Sup again")
puts ex1.two(5, 4)

