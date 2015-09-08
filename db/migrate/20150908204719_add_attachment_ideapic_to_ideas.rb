class AddAttachmentIdeapicToIdeas < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.attachment :ideapic
    end
  end

  def self.down
    remove_attachment :ideas, :ideapic
  end
end
