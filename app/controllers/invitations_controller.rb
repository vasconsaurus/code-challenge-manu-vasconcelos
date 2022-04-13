class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.create(invitation_params)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :message)
  end

  respond_to? :js
end
