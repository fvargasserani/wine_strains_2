class Strain < ApplicationRecord
    has_many :wine_strains, inverse_of: :strain
    has_many :wines, inverse_of: :strain, class_name:'Wine', through: :wine_strains, dependent: :destroy
    validates_uniqueness_of :name, case_sensitive: false
    validates :name, presence:true
end
