class Message
  include Mongoid::Document
  include Mongoid::Spacial::Document

  field :nick, :type => String
  validates :nick, presence: true
  field :content, :type => String
  validates :content,presence: true
  field :location, :type => Array, spacial: {lat: :latitude, lng: :longitude, return_array: true }
  validates :location, presence: true
  field :date_time, :type => Date
  field :channel, :type => String
  validates :channel, presence: true

  scope :channel, ->(channel) { where(channel: channel) }
  scope :location, ->(location) { where(:location.near => [location,2]) }

  spacial_index :source
end
