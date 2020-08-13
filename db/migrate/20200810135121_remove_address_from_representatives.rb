# frozen_string_literal: true

class RemoveAddressFromRepresentatives < ActiveRecord::Migration[5.2]
    def change
        remove_column :representatives, :address, :string
    end
end
