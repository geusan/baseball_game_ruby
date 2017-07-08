class HomeController < ApplicationController
  def index
    
  end
  
  def bridge
    # 게임방 만들기
    gametype = params[:gametype]
    # 난수 발생으로 3자리 난수 발생시킨다.
    answer = 0
    arr = (1..9).to_a.sample(gametype.to_i)
    r_arr = arr.shuffle
    r_arr.each_with_index do |num,i|
      answer += num * 10 ** i 
    end
    # 게임방 Game 생성 ( id, answer )
    new_game = Game.new
    new_game.answer = answer
    new_game.save
    # 가장 마지막에 만들어진 게임방 id 가져오기
    
    last_game  = Game.all.last
    
    
    # 만들어진 게임방으로 리다이렉트 
    # /game3/:게임방id
    redirect_to "/game3/#{last_game.id}"
    
  end


  def try
    # 시도하려는 숫자 받아오기
    g_num = params[:g_num]
    temp = params[:attempt]
    i = 0
    strike = 0
    ball = 0
    
    # 게임방의 답 가져오기
    answer = Game.find(g_num).answer
    
    # 답이랑 비교하기
    s_temp = temp.to_s
    s_answer = answer.to_s
    
    # 모든 자릿수를 순회하며 비교
    while i < s_answer.size
      if s_answer.include? s_temp[i]
        if s_temp[i] == s_answer[i]
          strike += 1
        else
          ball += 1
        end
      end
      i+=1
    end
    
    # 시도한 걸 저장
    new_attempt = Attempt.new
    new_attempt.g_num = g_num
    new_attempt.number = temp
    new_attempt.strike = strike
    new_attempt.ball = ball
    new_attempt.save
    
    redirect_to "/game3/#{g_num}"
    
  end
  
  
  def game3
    
    # 게임방 이름 파라미터로 받기
    @g_num = params[:g_num]
    
    # 게임방이름과 일치하는 정보들 가져오기
    @show_tries = Attempt.where(g_num:@g_num)
    
  end

end
