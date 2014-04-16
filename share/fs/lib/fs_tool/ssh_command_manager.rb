class FsTool::SshCommandManager
  def initialize
    @server_list = FsTool::ServerList.new
  end

  def parse(*args)
    if server = @server_list.find(*args)
      [server, command_params(server, args)]
    end
  end

  def completions
    @server_list.names
  end

  private

  def command_params(server, args)
    command_args = args.join('###').sub(/^#{server.name}###/, '').strip.split('###')
    server.params.merge(args: command_args)
  end
end
