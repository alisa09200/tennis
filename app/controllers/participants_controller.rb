class ParticipantsController < ApplicationController
  def create
    participant = Participant.create(participant_params)
    redirect_to reservation_path(params[:reservation_id])
  end

  private
  def participant_params
    params.require(:participant).permit(:text).merge(reservation_id: params[:reservation_id], user_id: current_user.id)
  end
end
