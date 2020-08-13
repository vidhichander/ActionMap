# frozen_string_literal: true

class AddDataToRepresentatives < ActiveRecord::Migration[5.2]
    def change
        add_column :representatives, :party, :string
        add_column :representatives, :phones, :string
        add_column :representatives, :emails, :string
        add_column :representatives, :photo, :string
    end
end
