# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            ocdid_temp = ''
            title_temp = ''
            city = ''
            street = ''
            state = ''
            zip = ''
            email = ''
            party = ''
            phone = ''
            photo = ''


            rep_info.offices.each do |office|
                if office.official_indices.include? index
                    title_temp = office.name
                    ocdid_temp = office.division_id
                end
            end

            if !official.address.nil?
              official.address.each do |loc|
                city = loc.city
                street = loc.line1
                state = loc.state
                zip = loc.zip
              end
            end

            if !official.emails.nil?
              email = official.emails.pop
            end

            if !official.party.nil?
              party = official.party
            end

            if !official.phones.nil?
              phone = official.phones.pop
            end

            if !official.photo_url.nil?
              photo = official.photo_url
            end

            rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
                title: title_temp, city: city, state: state, street: street, zip: zip, party: party, phones: phone, emails: email, photo: photo})
            reps.push(rep)
        end

        reps
    end
end
