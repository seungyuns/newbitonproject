require 'open-uri'
class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/home/mainview'
    end
    
  end
  
  def quiz1
    @answer = params[:answer]
    unless @answer == "newbie"
    flash[:fail] = "#{@answer}는 답이 아닙니다."
      redirect_to "/home/index2"
    end
  end
  
  def quiz2
    num_ary = (1..5).to_a
    @name = []
    @image = []
    @description = []
    num_ary.each do |num|
      url = 'http://www.pokemonkorea.co.kr/pokedex/single/'+num.to_s
      doc = Nokogiri::HTML(open(url))
      name = doc.css('h1').text
      @name << name
      image = doc.css('.feature_img').map{ |i| i['src'] }
      @image << image
      description = doc.css('div.descriptionX').text
      @description << description
    end
    
    @answer = params[:answer]
    unless @answer == "iframe"
    flash[:fail] = "#{@answer}는 답이 아닙니다."
      redirect_to "/home/quiz1?answer=newbie"
    end
  end
  
  def quiz3
    @answer = params[:answer]
    unless @answer == "crawling"
    flash[:fail] = "#{@answer}는 답이 아닙니다."
      redirect_to "/home/quiz2?answer=iframe"
    end
  end
  
  def quiz4
     @answer = params[:answer]
    unless @answer == "carousel"
    flash[:fail] = "#{@answer}는 답이 아닙니다."
      redirect_to "/home/quiz3?answer=crawling"
    end
  end
  
  def mainview
    
  end
  def value_save
    @string_bool = params[:isfront]
    @bool = false
    
    if @string_bool == "true" then 
      @bool = true
    end

    current_user.update(isfront: @bool)
    
    if current_user.isfront == true
      @front_id = User.where(isfront:  true).ids.sample(1)
      @front_id << current_user.id
      @front = User.where(id: @front_id)
      @back  = User.where(isfront: false).sample(2)
    else
      @front = User.where(isfront:  true).sample(2)
      @back_id  = User.where(isfront: false).ids.sample(1)
      @back_id << current_user.id
      @back = User.where(id: @back_id)
    end
    render 'maketeam'
    
    # redirect_to "/home/maketeam"
  end
  
  def note_1
   @Post.all
   
  end
  
  def title
    @Post.title
    
  end
  
  def create
    
    @post = Post.new
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    uploader = ImageuploaderUploader.new
    uploader.store!(params[:image])
    @post.image= uploader.url
    @post.save
    redirect_to :root
    
  end
  # 
end