class ListsController < ApplicationController
  # GET /lists
  # GET /lists.json
  before_filter :authenticate_user!

  def index
    @lists = current_user.lists

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = current_user.lists.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/new
  # GET /lists/new.json
  def new
    @list = List.new
    @list.user = current_user
    @games = Game.all
    @levels = @list.levels.order("position")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  def add_level
    list = current_user.lists.find(params[:list_id])
    list.list_levels.create level_id: params[:level_id]
    render nothing: true
  end

  def sort
    params[:id].each_with_index do |id, index|
      ListLevel.update_all({position: index+1}, {level_id: id})
    end
    render nothing: true
  end

  # GET /lists/1/edit
  def edit
    @list = current_user.lists.find(params[:id])
    @games = Game.all
    @levels = @list.levels
  end

  # POST /lists
  # POST /lists.json
  def create
    video = params[:video]
    params[:list][:video] = video[video.rindex("/")+1..video.rindex(".")-1]

    @list = List.new(params[:list])
    @list.user = current_user

    respond_to do |format|
      if @list.save
        format.html { redirect_to edit_list_url(@list.id), notice: 'List was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.json
  def update
    video = params[:video]
    params[:list][:video] = video[video.rindex("/")+1..video.rindex(".")-1]

    @list = current_user.lists.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to lists_url, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
  end
end
