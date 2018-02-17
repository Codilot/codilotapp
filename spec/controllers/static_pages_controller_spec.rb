require 'rails_helper'



describe StaticPagesController, type: :controller do 

  
    get_actions = [[:landing_page, 'landing_page'], 
                   [:about, 'about'],
                   [:contact, 'contact'],
                   [:dining, 'dining'],
                   [:lighting, 'lighting'],
                   [:living, 'living']]

    get_actions.each do |action|  
      it "renders the #{action[1]} template" do
        get action[0]
        expect(response).to be_ok
        expect(response).to render_template(action[1])
      end
    end
 

end
