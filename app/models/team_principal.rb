# == Schema Information
#
# Table name: team_principals
#
#  id          :bigint           not null, primary key
#  birthday    :date
#  common_name :string
#  first_name  :string
#  last_name   :string
#  nationality :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :bigint           not null
#
# Indexes
#
#  index_team_principals_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class TeamPrincipal < ApplicationRecord
  belongs_to :team

  validates :first_name, :last_name, :common_name, :nationality, :birthday, :team_id, presence: true
end
