class Oenologist < ApplicationRecord
    has_many :wine_oenologists, inverse_of: :oenologist
    has_many :wine, inverse_of: :oenologist, class_name:'Wine', through: :wine_oenologists, dependent: :destroy
    has_many :magazine_oenologists
    has_many :magazines, class_name:'Magazine', through: :magazine_oenologists, dependent: :destroy
    validates :name, presence:true
    validates :age, presence:true
    validates :nationality, presence:true
    accepts_nested_attributes_for :magazine_oenologists, allow_destroy: true
    accepts_nested_attributes_for :magazines, allow_destroy: true

    def magazine_name
        Magazine.pluck(:name)
    end
end
