class Book < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: {
    message: "Le titre doit être renseigné."
  }

  validates :author, presence: {
    message: "L'Auteur doit être renseigné."
  }

  validates :title, uniqueness: {
    message: "Le titre est déjà pris !"
  }
end
