class JoinedUpDataset
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Taggable
  include PublicActivity::Model
  tracked
  before_save :set_time

  field :created_at, type: Time
  field :edited_at, type: Time


  # TODO -> scope out joined up data
  field :time_value, type: String
  field :time_format, type: String

  has_one :space_value # related to space_value
  has_one :data_serie # related to data series

  protected
  def set_time
    if created_at.nil?
      self.created_at = Time.now
    else
      self.edited_at = Time.now  # update the edited time
    end
  end

end