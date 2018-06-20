class UserController < ApplicationController
  def index
    @users = User.all
    @current_user = User.find(session[:current_user]) if session[:current_user]
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end
  
  def create
    user = User.new
    user.user_name = params[:user_name]
    user.password = params[:password]
    user.ip_address = request.ip
    user.save
    
    redirect_to "/user/#{user.id}"
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.password = params[:password]
    user.save
    
    redirect_to "/user/#{user.id}"
  end
  
  def sign_in
    # 로그인 되어있는지 확인하고
    # 로그인 되어있으면 원래 페이지로 돌아가기
  end
  
  def login
    # 유저가 입력한 아이디와 패스워드를 바탕으로
    # 실제로 로그인이 이뤄지는 곳
    id = params[:user_name]
    pw = params[:password]
    # index 값을 찾기 위해 유저가 입력한 user_name을 기반으로
    user = User.find_by_user_name(id)
    
    if !user.nil? and user.password.eql?(pw)
      # 해당 user_id로 가입한 유저가 있고, 패드워드도 일치하는 경우
      session[:current_user] = user.id
      flash[:success] = "로그인에 성공했습니다."
      redirect_to "/users"
      
    else
      # 가입한 유저 아이디가 없거나, 패스워드가 틀린 경우
      flash[:error] = "가입된 유저가 아니거나, 비밀번호가 틀립니다."
      redirect_to "/sign_in"
    end
  
  end
  
  def logout
    session.delete(:current_user)
    flash[:success] = "로그아웃 성공"
    redirect_to "/users"
  end
  
  
end
