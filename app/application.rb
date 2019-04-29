class Application
  @@items = []
  
  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.patch.split("/items/").last
      matching_item = @@items.detect {|item| item.name == item_name}
      if matching_item
        resp.write matching_item.price
      else
        resp.write "No such item"
        resp.status = 400
      end
      
    else
      resp.write "Bad URL"
      resp.status = 404
    end
    
    
    
    
    
    resp.finish
  end
  
  
end