class Api::V1::ImporterController < ApplicationController

    def create

        file = params[:file]
        if file.present? && file.original_filename.end_with?('.csv')
            CsvImporterWorkerJob.perform_later(file.tempfile)
            render :json => {message: 'Upload in progress, we will notify you when done'}, status: :accepted
        else
            render :json => {message: 'Error uploading file'}, status: :unprocessable_entity
        end

    end
end