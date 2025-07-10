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
end
