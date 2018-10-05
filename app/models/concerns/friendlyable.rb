require 'digest'

module Friendlyable
  extend ActiveSupport::Concern
  included do
    extend ::FriendlyId
    before_create :set_hash_id
    friendly_id :auth
  end
  def set_hash_id
    hash_id = nil
    loop do
      emailstr= Digest::SHA256.hexdigest self.email
    #  hash_id = SecureRandom.urlsafe_base64(9).gsub(/-|_/,('a'..'z').to_a[rand(26)])
      hash_id= emailstr[0,8]
      break unless self.class.name.constantize.where(:auth => hash_id).exists?
    end
    self.auth = hash_id
  end
end
