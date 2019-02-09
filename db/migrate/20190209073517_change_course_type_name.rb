class ChangeCourseTypeName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :courses, :course_type, :course_provider
  end
end
