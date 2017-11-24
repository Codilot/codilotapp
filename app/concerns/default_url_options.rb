module DefaultUrlOptions
  
  # Including this file sets the default url options. This is useful for mailers or background jobs
  
  def default_url_options
    {
      :host => host
    }
  end
  
private

  def host
    host = 'moebi.herokuapp.com'
  end
  
end