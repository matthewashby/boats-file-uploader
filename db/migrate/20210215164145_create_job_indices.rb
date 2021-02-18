class CreateJobIndices < ActiveRecord::Migration[6.0]
  def change
    create_table :job_indices do |t|
      t.datetime :date, null: false
      t.boolean :active, default: false
      t.decimal :banking_and_markets, default: 0
      t.decimal :investment_management, default: 0
      t.decimal :insurance, default: 0
      t.decimal :wealth_and_private, default: 0
      t.decimal :fintech, default: 0
      t.decimal :information_services, default: 0

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        JobIndex.create!(date: Time.now) if JobIndex.this_month.blank?
        JobIndex.create!(date: 1.month.ago) if JobIndex.last_month.blank?
      end
    end
  end
end
