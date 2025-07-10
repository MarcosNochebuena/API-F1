# == Schema Information
#
# Table name: results
#
#  id            :bigint           not null, primary key
#  laps          :integer
#  points        :integer
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  driver_id     :bigint           not null
#  grand_prix_id :bigint           not null
#  team_id       :bigint           not null
#
# Indexes
#
#  index_results_on_driver_id      (driver_id)
#  index_results_on_grand_prix_id  (grand_prix_id)
#  index_results_on_team_id        (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (driver_id => drivers.id)
#  fk_rails_...  (grand_prix_id => grand_prixes.id)
#  fk_rails_...  (team_id => teams.id)
#
class Result < ApplicationRecord
  belongs_to :grand_prix
  belongs_to :driver
  belongs_to :team

  validates :laps, :points, :position, :driver_id, :grand_prix_id, :team_id, presence: true
end
