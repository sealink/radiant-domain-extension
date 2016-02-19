module DomainTags
  include Radiant::Taggable

  desc %{ <r:domain_key /> }
  tag 'domain_key' do |tag|
    Domain.new(request).key
  end

  desc %{ <r:domain /> }
  tag 'domain' do |tag|
    Domain.new(request).host
  end

  desc %{ <r:if_domain_key value="site_a_key"></r:if_domain_key> }
  tag 'if_domain_key' do |tag|
    domain_key = Domain.new(request).key.to_s
    tag.expand if domain_key == tag.attr['value']
  end
end
