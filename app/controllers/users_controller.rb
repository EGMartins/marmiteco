class UsersController < LoggedController
  before_action :set_user, only: %i[show edit update destroy]
  respond_to :html, :json

  def index
    @users = User.all
    respond_with @users
  end

  def show
  end

  def new
    @user = User.new
    respond_with @user
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = 'Usuário Criado!' if @user.save
    respond_with @user
  end

  def update
    flash[:notice] = 'Usuário atualizado' if @user.update(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    flash[:notice] = 'Usuário apagado!' if @user.destroy
    respond_with @user
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest)
    end

end
