class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(cycle: Cycle.find(params[:cycle_id]))
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    # hash with email string, break string, turn into array
    email_ary = h[:email].split(" ")
    # if email array has 2 elements, first is name, second is email
    if email_ary.count > 1
      # save instance with name and email
      @invitation = Invitation.new
      @invitation.name = email_ary[0]
      @invitation.email = email_ary[1]
      @invitation.cycle_id = #????
    else
      @invitation = Invitation.new(invitation_params)
    end
    # else it only has an email

    @invitation.save
    # se salvar o veículo? e se não salvar?
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :message, :name)
  end
end
