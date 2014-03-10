class FsTool::SshCommandManager
  def initialize(command = nil)
    @server_list, @command = FsTool::ServerList.new, command
  end

  def process(*args)
    if server = @server_list.find(args.join(' '))
      run_on(server, @command)
    else
      $stderr.puts('unknown application or environment')
    end
  end

  def completions
    @server_list.completions
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
