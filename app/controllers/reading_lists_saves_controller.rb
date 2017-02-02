class ReadingListsController < ApplicationController

  before_action :get_params

  # Adds a paper to a reading list
  # post/get?  reading_list_save?paper_id=X&reading_list_id=Y
  # called in ajax from papers/show or _paper_list
  def create
    if @reading_list.nil?
      reading_list_save = ReadingList.create(paper_id: @paper_id, )
    else
      reading_list_save = ReadingList.create(reading_list_params)
    end
    redirect_to reading_list_save.reading_list_id
  end

  private

    #
    def reading_list_params
      params.require(:reading_list).permit(:paper_id, :reading_list_id)
    end

  def get_params
    @paper = params[:paper_id]
    @reading_list = params[:reading_list_id]
  end

end
