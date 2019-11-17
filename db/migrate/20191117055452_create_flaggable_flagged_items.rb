class CreateFlaggableFlaggedItems < ActiveRecord::Migration[5.2]
  def change
    # If pgcrypto is install we assume they are using uuids
    id_type = pgcrypto_exists? ? :uuid : :bigint

    create_table :flaggable_flagged_items, id: id_type do |t|
      t.references :flaggable, polymorphic: true, null: false, type: id_type, index: { name: 'idx_flagged_items_flaggable' }
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

  private

  def pgcrypto_exists?
    select_value "select exists(select * from pg_proc where proname = 'gen_random_uuid');"
  end
end
