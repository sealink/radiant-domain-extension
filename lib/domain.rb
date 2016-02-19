class Domain
  def initialize(request, domains_file = nil)
    @host = request.host
    @domains_file = domains_file
  end


  def key
    domain['key']
  end


  def host
    @host
  end


  private

  def domain
    @domain ||= find_domain
  end


  def find_domain
    domain_key_value = domains.detect { |_key, domain|
      domain['host'] == @host
    }
    unless domain_key_value
      raise ArgumentError, "host is not part of the domain file"
    end
    domain_key_value.last # last returns attributes
  end


  def domains
    @domains ||= load_file
  end


  def load_file
    unless File.exists?(domains_file)
      raise ArgumentError, 'web_sites.yml file not found'
    end
    YAML::load(File.read(domains_file))
  end


  def domains_file
    @domains_file ||= "#{Rails.root}/config/web_sites.yml"
  end
end
