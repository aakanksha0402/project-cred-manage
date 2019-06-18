class ProjectEnvironment < ApplicationRecord
  belongs_to :project
  has_many :credentials

  enum name: [:development, :staging, :production ,:test]

end
