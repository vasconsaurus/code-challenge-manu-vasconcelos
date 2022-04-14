class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(cycle: Cycle.find(params[:cycle_id]))

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @invitation = Invitation.create(invitation_params)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :message)
  end
end
