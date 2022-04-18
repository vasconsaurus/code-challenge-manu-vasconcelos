class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(cycle: Cycle.find(params[:cycle_id]))
    respond_to do |format|
      format.js
    end
  end

  def create
    email_params = params[:invitation][:email]

    multiple_emails_ary = email_params.split(",")

    multiple_emails_ary.each do |email_ary|
      email_ary = email_ary.split(" ")
      invitation = Invitation.new(invitation_params)

      invitation.email = email_ary.pop
      invitation.name = email_ary.join(' ')

      if invitation.name.blank?
        invitation.name = invitation.email.split('@', 2).first
      end

      @invitation_ary = []
      @invitation_ary << invitation.save
    end

    @invitation_ary.each do |invitation|
      if invitation
        redirect_to root_path, notice: 'Invitation was succesfully created'
      else
        # this doesn't work
        render :new, notice: 'Invitation was not created'
      end
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :message, :name, :cycle_id)
  end
end
