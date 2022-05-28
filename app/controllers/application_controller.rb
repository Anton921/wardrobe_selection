class ApplicationController < ActionController::Base
    before_action :set_styles
    include Pagy::Backend

    private

    def set_styles
        @styles = Style.all
    end
end
