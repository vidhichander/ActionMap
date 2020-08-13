# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            city, street, state, zip, ocdid_temp, title_temp = ''

            rep_info.offices.each do |office|
                if office.official_indices.include? index
                    title_temp = office.name
                    ocdid_temp = office.division_id
                end
            end

            official.address&.each do |loc|
                city = loc.city, street = loc.line1, state = loc.state, zip = loc.zip
            end

            email = official.emails unless official.emails.nil?
            party = official.party unless official.party.nil?
            phone = official.phones unless official.phones.nil?
            photo = official.photo_url unless official.photo_url.nil?

            rep = Representative.create!({ name: official.name, ocdid: ocdid_temp, title: title_temp, city: city,
              state: state, street: street, zip: zip, party: party, phones: phone, emails: email, photo: photo })
            reps.push(rep)
        end
        reps
    end
end
