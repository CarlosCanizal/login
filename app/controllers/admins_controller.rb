class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.json
  protect_from_forgery
  include SessionsHelper

  #before_filter :signed_in_admin, only: [:edit, :update ]
  before_filter :signed_in_admin
  skip_before_filter :signed_in_admin, only: [:new, :create]


  def signed_in_admin
    redirect_to root_url, notice: "Please sign in." unless signed_in?
  end

  def index
    @admins = Admin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    @admin = Admin.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @admin }
    #end
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to admins_url, :notice => "Signed"
    else
      render "new"
    end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end
end
