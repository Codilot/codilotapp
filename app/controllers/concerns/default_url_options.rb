module DefaultUrlOptions
  
  # Including this file sets the default url options. This is useful for mailers or background jobs
  
  def default_url_options
    {
      :host => host,
      :port => port
    }
  end
  
private

  def host
    host = 'moebi.herokuapp.com'
  end
  
  def port
    port = '587'
  end
  
end