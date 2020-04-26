class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    Aws.config.update(region: 'us-east-2')
    s3_service = Aws::S3::Resource.new
    bucket_path_photo = 'brenda/'+File.basename(params[:user][:photo].original_filename)
    bucket_path_coverimage = 'brenda/'+File.basename(params[:user][:coverimage].original_filename)

    s3_file_photo = s3_service.bucket('ror-capstone').object(bucket_path_photo)
    s3_file_coverimage = s3_service.bucket('ror-capstone').object(bucket_path_coverimage)

    s3_file_photo.upload_file(params[:user][:photo].path, acl: 'public-read')
    s3_file_coverimage.upload_file(params[:user][:coverimage].path, acl: 'public-read')

    @user = User.new(username: params[:user][:username], fullname: params[:user][:fullname], photo: params[:user][:photo], coverimage: params[:user][:coverimage])
    
    @user.photo = s3_file_photo.public_url.to_s
    @user.coverimage = s3_file_coverimage.public_url.to_s
    
    if @user.save
      redirect_to home_path
      login(@user.id)
    else
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
    #@opinions = User.created_opinions.ordered_by_most_recent
  end
  def follow_user
    current_user.follow_user(params[:id])
    redirect_to user_path(params[:id])
  end
end
