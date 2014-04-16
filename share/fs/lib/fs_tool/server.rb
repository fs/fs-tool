class FsTool::Server
  attr_reader :name, :environment, :address, :root
  alias_method :env, :environment

  def initialize(params = {})
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def params
    {
      name: name,
      environment: environment,
      env: environment,
      root: root
    }
  end

  def run(command = nil)
    if command
      exec("ssh #{address} -t 'cd #{root}; #{command}'")
    else
      open_ssh_session
    end
  end

  def open_ssh_session
    exec("ssh #{address} -t 'cd #{root}; $SHELL'")
  end
end
