class FilesController < ApplicationController
  def index
    @path = params[:path] || '/'
    @files = Dir.glob(File.join(@path, '*'))
    @directories = @files.select { |f| File.directory?(f) }.map { |d| File.basename(d) }
    render :index
  end

  def show
    path = params[:path]
    if File.file?(path)
      send_data path
    else
      redirect_to files_path(path: path)
    end
  end

end
