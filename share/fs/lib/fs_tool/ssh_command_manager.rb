class FsTool::SshCommandManager
  def initialize(command = nil)
    @server_list, @command = FsTool::ServerList.new, command
  end

  def process(*args)
    if server = @server_list.find(*args)
      params = command_params(server, args)
      run_on(server, @command, params)
    else
      raise FsTool::ServerNotFoundException
    end
  end

  def completions
    @server_list.names
  end

  private

  def run_on(server, command, params = nil)
    if command.nil?
      exec "ssh #{server.address}"
    else
      exec "ssh #{server.address} -t '#{command % params}'"
    end
  end

  def command_params(server, args)
    subject = args.join(' ').sub(/^#{server.name}/, '').strip
    server.params.merge(subject: subject)
  end
end

class FsTool::ServerNotFoundException < StandardError; end
