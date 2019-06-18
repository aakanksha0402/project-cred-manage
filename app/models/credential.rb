class Credential < ApplicationRecord
  belongs_to :project_environment
  has_many :credential_keys
end
