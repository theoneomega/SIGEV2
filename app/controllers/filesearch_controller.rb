class FilesearchController < ApplicationController
  def index

    @files = Eventfile.all
  end
end
