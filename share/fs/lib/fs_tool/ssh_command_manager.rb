class FsTool::SshCommandManager
  def initialize(command = nil)
    @server_list, @command = FsTool::ServerList.new, command
  end

  def process(*args)
    if server = @server_list.find(*args)
      run_on(server, @command)
    else
      raise FsTool::ServerNotFoundException
    end
  end

  def completions
    @server_list.names
  end

  private

  def run_on(server, command)
    if command.nil?
      exec "ssh #{server.address}"
    else
      exec "ssh #{server.address} -t '#{command % server.params}'"
    end
  end
end

class FsTool::ServerNotFoundException < StandardError
end
