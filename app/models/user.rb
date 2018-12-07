class User < ApplicationRecord

  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy

  

  # #2
  before_save { self.email = email.downcase if email.present? }
  before_save :format_name
  before_save { self.role ||= :member }




# #3
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
# #4
validates :password, presence: true, length: { minimum: 6 }, if: -> { password_digest.nil? }

 validates :password, length: { minimum: 6 }, allow_blank: true
# #5
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

# #6
  has_secure_password

def format_name
  if name

    name_array = []
    name.split.each do |name_part|

      name_array << name_part.capitalize
    end
    self.name = name_array.join(" ")

  end


  end

  enum role: [:member, :admin, :moderator]



end





# At #2, we register an inline callback directly after the before_save callback.  { self.email = email.downcase }
# is the code that will run when the callback executes.
#
# Per Ruby's documentation, "callbacks are hooks into the life cycle of an Active Record object that allow you
# to trigger logic before or after an alteration of the object state." Callbacks are similar to receiving mail
# that has the "return service requested" mandate, along with a form to complete. As the receiver of the mail,
#  we are requested to return an envelope with the completed form. The requester in this example is analogous
#   to a User in our code. User is requesting that the database execute { self.email = email.downcase }. The
#    database is analogous to the receiver of the mail and is asked to execute { self.email = email.downcase }.
#
# At #3, we use Ruby's validates function to ensure that name is present and has a maximum and minimum length.
#
# At #4, we validate password with two separate validations:
#
# The first validation executes if password_digest is nil. This ensures that when we create a new user, they have
#  a valid password.
# The second validation ensures that when updating a user's password, the updated password is also six characters
#  long. allow_blank: true skips the validation if no updated password is given. This allows us to change other
#   attributes on a user without being forced to set the password.
# At #5, we validate that email is present, unique, case insensitive, has a minimum length, has a maximum length,
#  and that it is a properly formatted email address.
#
# At #6, we use Ruby's has_secure_password. has_secure_password "adds methods to set and authenticate against a
#  BCrypt password. This mechanism requires you to have a password_digest attribute". This function abstracts
#   away much of the complexity of obfuscating user passwords using hashing algorithms which we would otherwise
#    be inclined to write to securely save passwords.  has_secure_password requires a password_digest attribute
#     on the model it is applied to. has_secure_password creates two virtual attributes, password and
#      password_confirmation that we use to set and save the password.
# ||= is a Ruby trick. The code self.role ||= :member, then, is shorthand for  self.role = :member if self.role.nil?.
