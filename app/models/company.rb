class Company < ApplicationRecord
  has_rich_text :description

  def self.destroy_the_record(company)
    result = {}
    begin
      ActiveRecord::Base.transaction do
        company.destroy
        result = {message: "Successfully deleted #{company.name}"}
      end
    rescue => e
      result = {message: "Unable to delete #{company.name} due to #{e.message}"}
    end

    return result
  end

end
