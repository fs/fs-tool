class FsTool::ServerList
  CONFIG_FILE_NAME = '.fs.yml'.freeze

  attr_reader :servers

  def initialize
    @servers = load_servers
  end

  def find(*args)
    # TODO: this behaviour is suitable only for `fs ssh` subcommand. It may confuse user.
    # Running `fs c` in application with `default` server in `.fs.yml`
    # will open _remote_ console.
    if args.length == 0
      @servers['default']
    elsif server = @servers[args[0]]
      server
    else
      @servers[args.join(' ')]
    end
  end

  def names
    @servers.keys - ['default']
  end

  private

  def load_servers
    servers = {}

    if File.exists?(global_configuration_file)
      servers.merge!(YAML.load_file(global_configuration_file)['servers'])
    end

    if File.exists?(project_configuration_file)
      servers.merge!(YAML.load_file(project_configuration_file)['servers'])
    end

    convert_hashes_to_objects(servers)
  end

  def convert_hashes_to_objects(servers)
    servers.each do |name, values|
      servers[name] = FsTool::Server.new(values.merge(name: name))
    end
  end

  def project_configuration_file
    File.join(Dir.pwd, CONFIG_FILE_NAME)
  end

  def global_configuration_file
    File.join(ENV['HOME'], CONFIG_FILE_NAME)
  end
end
