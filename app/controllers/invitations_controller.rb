class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(cycle: Cycle.find(params[:cycle_id]))
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    email_params = params[:invitation][:email]
    email_ary = email_params.split(" ")

    @invitation = Invitation.new(invitation_params)

    if email_ary.count > 1
      @invitation.name = email_ary[0]
      @invitation.email = email_ary[1]
    else
      @invitation.name = email_params.split(/@/, 2).first
    end

    if @invitation.save!
      redirect_to root_path, notice: 'Invitation was succesfully created'
    else
      # this does not work
      render :new, notice: 'Invitation was not created'
    end

  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :message, :name, :cycle_id)
  end
end
