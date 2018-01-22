class GroupsController < AdminController

	def index
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
	end

	def edit
		@group = Group.find(params[:id])
	end

	def new
		@group = Group.new
	end

	def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def update
  	@group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to groups_path
    else
      render 'edit'
    end
  end

  def destroy
  	@group = Group.find(params[:id])
  	@group.destroy
  	redirect_to groups_path, notice: 'Group deleted'
  end

   def group_params
      params.require(:group).permit(:name)
  end


end
