module Organization
  class Data < Grape::API
 
    resource :organization_data do
      desc "List all Org"
 
      get do
        Org.all
      end

      desc "create a new organization"
      ## This takes care of parameter validation
      params do
        requires :url, type: String
      end
      ## This takes care of creating Org
      post do 
        Org.create!({
          url:params[:url],
          name:params[:name],
          name_score:params[:name_score]
        })
      end
 
    end
 
  end
end