class UsersController < ApplicationController
  before_action :require_login, only: %i[show follow_user edit update]
  before_action :require_logout, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    s3_service = Aws::S3::Resource.new
    @user = User.new(username: params[:user][:username], fullname: params[:user][:fullname])
    if params[:user][:photo] && params[:user][:coverimage]
      bucket_path_photo = 'brenda/' + File.basename(params[:user][:photo].original_filename)
      bucket_path_coverimage = 'brenda/' + File.basename(params[:user][:coverimage].original_filename)

      s3_file_photo = s3_service.bucket('ror-capstone').object(bucket_path_photo)
      s3_file_coverimage = s3_service.bucket('ror-capstone').object(bucket_path_coverimage)

      s3_file_photo.upload_file(params[:user][:photo].path, acl: 'public-read')
      s3_file_coverimage.upload_file(params[:user][:coverimage].path, acl: 'public-read')

      @user.photo = s3_file_photo.public_url.to_s
      @user.coverimage = s3_file_coverimage.public_url.to_s
    end

    if @user.save
      redirect_to home_path
      login(@user.id)
    else
      flash.now[:messages] = 'Please verify your submission'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update

    s3_service = Aws::S3::Resource.new
    @user = User.find(current_user.id)

    if params[:user][:photo] && params[:user][:coverimage]
      bucket_path_photo = 'brenda/' + File.basename(params[:user][:photo].original_filename)
      bucket_path_coverimage = 'brenda/' + File.basename(params[:user][:coverimage].original_filename)

      s3_file_photo = s3_service.bucket('ror-capstone').object(bucket_path_photo)
      s3_file_coverimage = s3_service.bucket('ror-capstone').object(bucket_path_coverimage)

      s3_file_photo.upload_file(params[:user][:photo].path, acl: 'public-read')
      s3_file_coverimage.upload_file(params[:user][:coverimage].path, acl: 'public-read')

      @user.photo = s3_file_photo.public_url.to_s
      @user.coverimage = s3_file_coverimage.public_url.to_s
    end

    @user.username=params[:user][:username]
    @user.fullname=params[:user][:fullname]

    if @user.save
      flash[:success] = "Profile updated!"
      redirect_to edit_user_path(current_user.id)
    else
      flash.now[:message_edit] = @user.errors.full_messages
      render 'edit'
    end
  end

  def follow_user
    current_user.follow_user(params[:id])
    redirect_to user_path(params[:id])
  end

  def require_login
    redirect_to login_path unless current_user
  end

  def require_logout
    redirect_to home_path if current_user
  end
end
