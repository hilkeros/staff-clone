class UsersController < AdminController

  def index
  	@users = User.all
  end

  def show
  	 @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

   def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to users_path, notice: 'User deleted'
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password,
          :password_confirmation, :admin, :group_id)
  end



end
