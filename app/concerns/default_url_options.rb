module DefaultUrlOptions
  
  # Including this file sets the default url options. This is useful for mailers or background jobs
  
  def default_url_options
    { 
      :protocol => protocol,
      :host => host
    }
  end
  
private

  def host
    host = 'moebi.herokuapp.com'
  end

  def protocol
    protocol = 'https'
  end
  
end
