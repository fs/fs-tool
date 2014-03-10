class FsTool::Server
  attr_reader :name, :environment, :address, :root

  def initialize(params = {})
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
