class PagesController < ApplicationController
  def index
 	@current_user_name = current_user.name
 	@current_user_profile = current_user.profile
 	@picture = current_user.picture
  	@introductions = current_user.introductions
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @introduction }
    end

  end
  
  def show
    $user_id = User.find(params[:id]).id
  	@user_name = User.find(params[:id]).name
  	@user_profile = User.find(params[:id]).profile 
    @introduction = User.find(params[:id]).introductions

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @introduction }
    end
  end

  def new
    @introduction = Introduction.new
   #respond_to do |format|
      #format.html # new.html.erb
      #format.xml  { render :xml => @introduction }
    #end
  end
    def create
    @introduction = Introduction.new(params[:introduction])
    @introduction[:author] = current_user.id
    @introduction[:user_id] = $user_id 
    #if @introduction.save
    #redirect_to "/pages/#{$user_id}"
    respond_to do |format|
      if @introduction.save
        format.html { redirect_to :action => "/pages/#{$user_id}", :notice => 'Introduction was successfully created.' }
        format.xml  { render :xml => :introduction, :status => :created, :location => :introduction }
      else
        format.html { render :action => "pages/#{$user_id}" }
        format.xml  { render :xml => :introduction.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def upload
    if current_user.picture
       @picture = current_user.picture
    else
       @picture = Picture.new
       @picture.user_id = current_user.id
    end
@picture.content_type = params[:picture_file].content_type
@picture.picture_data = params[:picture_file].read
@picture.save
redirect_to(pages_path, :notice => 'Picture was successfully updated.')
    #respond_to do |format|
      #if @picture.update_attributes(params[:picture_file])
        #format.html { redirect_to(pages_path, :notice => 'Picture was successfully updated.') }
        #format.xml  { head :ok }
      #else
        #format.html { render :action => "picture" }
        #format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      #end
    #end
  end
   
  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy

    respond_to do |format|
      format.html { redirect_to(pages_path) }
      format.xml  { head :ok }
    end
  end

  def search
  end
  
 def result
  @users = []
  User.all.each do |y|
  if y.name.downcase == params[:name].downcase
      @users << y
  end
  end
  render :result
  end
  
  def show_picture
    @picture = Picture.find(params[:id])
    send_data(@picture.picture_data, :type=> @picture.content_type)
  end 

 def picture
    if current_user.picture
       @picture = current_user.picture
    else
       @picture = Picture.new
       @picture.user_id = current_user.id
    end
 end

end
