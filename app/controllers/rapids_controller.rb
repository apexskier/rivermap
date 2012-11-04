class RapidsController < ApplicationController
  # GET /rapids
  # GET /rapids.json
  def index
    @rapids = Rapid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rapids }
    end
  end

  # GET /rapids/1
  # GET /rapids/1.json
  def show
    @rapid = Rapid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rapid }
    end
  end

  # GET /rapids/new
  # GET /rapids/new.json
  def new
    @rapid = Rapid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rapid }
    end
  end

  # GET /rapids/1/edit
  def edit
    @rapid = Rapid.find(params[:id])
  end

  # POST /rapids
  # POST /rapids.json
  def create
    @rapid = Rapid.new(params[:rapid])

    respond_to do |format|
      if @rapid.save
        format.html { redirect_to @rapid, notice: 'Rapid was successfully created.' }
        format.json { render json: @rapid, status: :created, location: @rapid }
      else
        format.html { render action: "new" }
        format.json { render json: @rapid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rapids/1
  # PUT /rapids/1.json
  def update
    @rapid = Rapid.find(params[:id])

    respond_to do |format|
      if @rapid.update_attributes(params[:rapid])
        format.html { redirect_to @rapid, notice: 'Rapid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rapid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rapids/1
  # DELETE /rapids/1.json
  def destroy
    @rapid = Rapid.find(params[:id])
    @rapid.destroy

    respond_to do |format|
      format.html { redirect_to rapids_url }
      format.json { head :no_content }
    end
  end
end
