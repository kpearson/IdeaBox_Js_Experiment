class Api::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      respond_with(idea, status: 200, location: api_ideas_path)
    else
      respond_with({errors: idea.errors}, status: 422, location: api_ideas_path)
    end
  end

  def update
    idea = Idea.find(params[:id])
    if item.update_attributes
      respond_with('', status: 204, location: api_ideas_path)
    else
      respond_with({errors: idea.errors}, status: 422, location: api_ideas_path)
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    if idea.delete
      respond_with('', status: 204, location: api_ideas_path)
    else
      respond_with({errors: idea.errors}, status: 422, location: api_ideas_path)
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
