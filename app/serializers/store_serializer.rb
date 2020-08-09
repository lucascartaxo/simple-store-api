# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StoreSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :address, :created_at
end
