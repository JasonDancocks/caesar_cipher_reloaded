require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'caesar_cipher_reloaded'

get '/' do
	if !params[:clear].nil?
		params[:text] = nil
		params[:shift] = nil
	end


	text = params[:text]
	shift = params[:shift].to_i
	if shift > 26
				shift = shift % 26
			end
	output = caesar_cipher(text,shift)

	erb :index, :locals => {
		:output => output,
		:text => params[:text],
		:shift => params[:shift]
	}
end

