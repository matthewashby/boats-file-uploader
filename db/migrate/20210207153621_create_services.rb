class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.string :service_type
      t.text :description

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        [
          { name: 'Personal Brand Tune-Up', service_type: 'Standard', price: 350 },
          { name: 'Personal Brand Tune-Up', service_type: 'Premium', price: 450 },
          
          { name: 'Interview Coaching', service_type: 'Standard', price: 325 },
          { name: 'Interview Coaching', service_type: 'Premium', price: 495 },
          
          { name: 'Job Market Navigator', service_type: 'Standard', price: 595 },
          { name: 'Job Market Navigator', service_type: 'Premium', price: 895 },
          { name: 'Job Market Navigator', service_type: 'White Glove', price: 995 },

          { name: 'The Career Explorer', service_type: 'Standard', price: 695 },
          { name: 'The Career Explorer', service_type: 'Premium', price: 975 },

          { name: 'Additional Services', service_type: 'Future proofing', price: 395 },
          { name: 'Additional Services', service_type: 'General coaching session', price: 195 },
          { name: 'Additional Services', service_type: 'Network mapping', price: 450 },
          { name: 'Additional Services', service_type: 'Salary or pay rise negotiation', price: 250 },
          { name: 'Additional Services', service_type: 'The first 90 days', price: 550 },
        ].each do |service|
          Service.create!(service)
        end
      end
    end
  end
end
