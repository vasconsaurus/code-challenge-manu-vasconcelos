class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(cycle: Cycle.find(params[:cycle_id]))
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    email_ary = params[:invitation][:email].split(" ")
    if email_ary.count > 1
      @invitation = Invitation.new
      @invitation.name = email_ary[0]
      @invitation.email = email_ary[1]
      @invitation.cycle_id = params[:invitation][:cycle_id]
    else
      @invitation = Invitation.new(invitation_params)
      @invitation.cycle_id = params[:invitation][:cycle_id]
    end

    if @invitation.save!
      redirect_to root_path, notice: 'Invitation was succesfully created'
    else
      # this does not work
      render :new, notice: 'Invitation was not created'
    end
    raise
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :message, :name)
  end
end
