# == Schema Information
#
# Table name: drivers
#
#  id          :bigint           not null, primary key
#  birthday    :date
#  common_name :string
#  first_name  :string
#  last_name   :string
#  nationality :string
#  number      :integer
#  role        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :bigint           not null
#
# Indexes
#
#  index_drivers_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class Driver < ApplicationRecord
  belongs_to :team
  has_many :results

  validates :first_name, :last_name, :common_name, :nationality, :number, :role, :team_id, presence: true

  enum :role, { first_driver: 0, second_driver: 1, reserve_driver: 2 }, default: :first_driver
end
