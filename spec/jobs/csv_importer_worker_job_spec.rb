require 'rails_helper'

RSpec.describe CsvImporterWorkerJob, type: :job do 
    describe "#perform" do 
        let(:csv_file) { Rails.root.join('test', 'fixtures/files', 'sf_restaurants.csv')}

        it "should process the csv data and insert into the owner, restauratns, inspection and addresses table" do 
            expect { CsvImporterWorkerJob.perform_now(csv_file)}.to change(Restaurant, :count).by_at_least(10)
        end
    end
end