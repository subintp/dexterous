require 'spec_helper'

describe Permission do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :track }

    %w{user_id track_id}.each do |mandatory_field|
        it "validates presence of #{mandatory_field}" do
            p = Permission.new
            expect(p).to have(1).error_on :"#{mandatory_field}"
            p.send :"#{mandatory_field}=", 1
            expect(p).to have(:no).error_on :"#{mandatory_field}"
        end
    end
    
    it "enforces view permission if edit permission is granted" do
        p = Permission.new can_edit: true, can_view: false
        expect(p).to have(1).error_on :can_view
        p.can_view = true
        expect(p).to have(:no).error_on :can_view
    end
    
    it "enforces edit permission if manage permission is granted" do
        p = Permission.new can_edit: false, can_manage: true
        expect(p).to have(1).error_on :can_edit
        p.can_edit = true
        expect(p).to have(:no).error_on :can_edit
    end
end
