module ApplicationCable
require 'SessionsController'
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end
#sessions class - sessions model... rename... as "place"
    private
      def find_verified_user
        if verified_railuser = User.find_by(id: cookies.encrypted[:user_id]) || User.find_by(id: $currentu)
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
