# == Schema Information
#
# Table name: circuits
#
#  id             :bigint           not null, primary key
#  capacity       :integer
#  circuit_length :integer
#  location       :string
#  name           :string
#  type           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Circuit < ApplicationRecord
  has_many :grand_prixes

  validates :name, :location, :circuit_length, :capacity, :type, presence: true

  enum :type, { permanent: 0, semi_permanent: 1, street: 2 }, default: :permanent
end
