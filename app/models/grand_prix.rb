# == Schema Information
#
# Table name: grand_prixes
#
#  id         :bigint           not null, primary key
#  date       :date
#  name       :string
#  round      :integer
#  total_laps :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  circuit_id :bigint           not null
#  season_id  :bigint           not null
#
# Indexes
#
#  index_grand_prixes_on_circuit_id  (circuit_id)
#  index_grand_prixes_on_season_id   (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (circuit_id => circuits.id)
#  fk_rails_...  (season_id => seasons.id)
#
class GrandPrix < ApplicationRecord
  belongs_to :circuit
  belongs_to :season
  has_many :results

  validates :name, :date, :total_laps, :round, :circuit_id, :season_id, presence: true
end
