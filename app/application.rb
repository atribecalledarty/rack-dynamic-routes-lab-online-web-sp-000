class Application
  @@items = []
  
  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.patch.split("/items/").last
      if @@items.detect {|item| item.name == item_name}
        
      
    else
      resp.write "Bad URL"
      resp.status = 404
    end
    
    
    
    
    
    resp.finish
  end
  
  
end