# db
class DeviseCreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents, id: :uuid do |t|

      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.string :name
      t.string :email
      t.string :cnic
      t.string :phone

      t.text :tokens

      t.timestamps null: false
    end

    add_index :parents, :email,                unique: true
    add_index :parents, :reset_password_token, unique: true
    # add_index :parents, :confirmation_token,   unique: true
    # add_index :parents, :unlock_token,         unique: true
  end
end
