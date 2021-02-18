class AddUser < ActiveRecord::Migration[6.0]
  def up
    user = User.find_or_initialize_by(email: 'dan@citycareerlab.com')

    if user.new_record?
      user.password = 'password'
      user.name = user.email
      user.save!
    end
  end
end
