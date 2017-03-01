class ReadingListSavesController < ApplicationController

  before_action :get_params
  before_action :check_if_list_owner

  # Adds a paper to a reading list
  # post/get?  reading_list_save?paper_id=X&reading_list_id=Y
  # called in ajax from papers/show or _paper_list
  def save
    ReadingListSave.create(paper_id: @paper_id, reading_list_id: @reading_list_id)
    redirect_to reading_list_path(@reading_list_id)
  end

  # Adds a paper to the default reading list of the user
  def save_default
    default_list = current_user.default_reading_list
    ReadingListSave.create(paper_id: @paper_id, reading_list_id: default_list.id)
    redirect_to reading_list_path(@reading_list_id)
  end

  # remove a paper from a reading list
  def remove
    ReadingListSave.where(paper_id: @paper_id, reading_list_id: @reading_list_id).destroy_all
    redirect_to reading_list_path(@reading_list_id), notice: t('reading_list_save.remove.success')
  end

  private
    #
    def reading_list_params
      params.require(:reading_list).permit(:paper_id, :reading_list_id)
    end

    def get_params
      @paper_id = params[:paper_id]
      @reading_list_id = params[:reading_list_id]
    end

    def check_if_list_owner
      list = ReadingList.where(id: @reading_list_id).take
      list.person_id == current_user.id
    end

end
