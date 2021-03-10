class AddPolymorphicToReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :reports, :review_id
    remove_column :reports, :spot_id
    add_reference :reports, :reportable, polymorphic: true
  end
end
