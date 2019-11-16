class CreateFlaggedItem < ActiveRecord::Migration[5.2]
  def change
    create_table :flagged_items, id: :uuid do |t|
      t.references :flaggable, polymorphic: true, null: false, type: :uuid
      t.integer :flagged_by_user_id
      t.string :reason
      t.string :preview
      t.datetime :reviewed_at
      t.datetime :reviewed_by_user_id
      t.text :comments
      t.integer :status, null:false, default: 0

      t.timestamps
    end
  end
end
