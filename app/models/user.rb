class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :nickname, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  has_many :requests, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :question_response
  has_many :histories
end
