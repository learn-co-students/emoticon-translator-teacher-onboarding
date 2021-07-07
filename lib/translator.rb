# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emolib_eng_jap = {'get_meaning' => {}, 'get_emoticon' => {}}
  rawlib_eng_jap = YAML.load_file(file_path)
  rawlib_eng_jap.each do |meaning, emos|
    emolib_eng_jap['get_meaning'][emos[1]] = meaning
    emolib_eng_jap['get_emoticon'][emos[0]] = emos[1]
  end
  return emolib_eng_jap
end

def get_japanese_emoticon(file_path, eng_emo)
  # code goes here
  emolib = load_library(file_path)
  japemo = emolib['get_emoticon'][eng_emo]
  # binding.pry
  if japemo == nil
    puts "Sorry, that emoticon was not found"
    return "Sorry, that emoticon was not found"
  else 
    return japemo
  end
end

def get_english_meaning(file_path, jap_emo)
  # code goes here
  emolib = load_library(file_path)
  meaning = emolib['get_meaning'][jap_emo]
  # binding.pry
  if meaning == nil
    puts "Sorry, that emoticon was not found"
    return "Sorry, that emoticon was not found"
  else 
    return meaning
  end
end