class Company < ApplicationRecord
  has_rich_text :description

  #validations
  validates :name, :zip_code, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@getmainstreet.\.com\z/,
                    message: "must be a getmainstreet.com account" }, :allow_blank => true


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
