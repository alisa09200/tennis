class ParticipantsController < ApplicationController
  def create
    participant = Participant.create(participant_params)
    #redirect_to reservation_path
    redirect_to root_path
  end

  private
  def participant_params
    params.require(:participant).permit(:name).merge(reservation_id: params[:reservation_id])
  end
end
