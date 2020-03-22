class Event < ApplicationRecord
    
    has_many :attendances
    has_many :users, through: :attendances
    
    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past #condition sur l'attribut start_date appellant une méthode privée ci-dessous

    validates :duration, presence: true
    validate :duration_modulo_5 #appelle la méthode multiple five et vérifie si duration est un multiple de 5

    validates :title, presence: true, length: { in: 5..140 }

    validates :description, presence: true, length: { in: 20..1000 }

    validates :price, presence: true, numericality: { in: 1..1000 }

    validates :location, presence: true

    private
    def start_date_cannot_be_in_the_past
        if start_date < Time.now
          errors.add(:start_date, 'The start_date can not in the past !')
        end
      end

    def duration_modulo_5
        if !(duration % 5 == 0 && duration >= 5)
          errors.add(:duration, 'Must be a multiple of 5')
        end
      end


end
