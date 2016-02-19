# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
class DomainExtension < Radiant::Extension
  version "1.0"
  description 'This extension is to determine things based on domain of request'
  url ''

  def activate
    require 'tags/domain_tags'
    Page.send :include, DomainTags
  end

  def deactivate
  end
end
