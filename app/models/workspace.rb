class Workspace
  include Mongoid::Document
  include Mongoid::Slug

  field :organization_name, type: String
  slug :organization_name
  field :location, type: String
  field :description, type: String

  has_many :memberships, dependent: :destroy
  has_many :datasets

  validates :organization_name, :location, :description, presence: true

  def users
    # get users that are members of this workspace
    User.in id: memberships.map(&:user_id)
  end
end
