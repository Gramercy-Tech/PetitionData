class SignersController < ApplicationController
  def import
    if params[:password] == ENV["file_password"]
      Signer.import(params[:file])
      redirect_to root_path, notice: "Signer Data imported!"
    else
      flash[:notice] = "Incorrect password!"
      redirect_to :back
    end
  end
end