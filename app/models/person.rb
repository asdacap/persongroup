class Person < ActiveRecord::Base
    
    validates :name,:phone,:address,:group_id, presence: true

    validates :phone, format: { with: /\A\+?[0-9\-]{8,13}\z/, message: "Please enter a valid phone number" }

    belongs_to :group

end
