class FsTool::Server
  attr_reader :name, :environment, :address, :root

  def initialize(params = {})
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def params
    {
      name: name,
      environment: environment,
      root: root
    }
  end

  def run(command = nil)
    if command
      exec("ssh #{address} -t 'cd #{root}; #{command}'")
    else
      exec("ssh #{address} -t 'cd #{root}; $SHELL'")
    end
  end
end
