class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]
    @text_word_array = @text.split


    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text_word_array.join('').length

    @word_count = @text_word_array.length

    @occurrences = @text_word_array.count(@special_word)
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f
    @monthly_apr = @apr/100/12
    @months_topay = @years*12
    @principal_monthly = @principal/@months_topay
    @monthly_apr_plsprin = @monthly_apr + 1

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================


    @monthly_payment = (@principal*@monthly_apr)/(1 - (@monthly_apr_plsprin**(@months_topay*-1)))
end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])
    @time_elps_seconds = @ending - @starting

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @time_elps_seconds
    @minutes = @time_elps_seconds/60
    @hours = @time_elps_seconds/60/60
    @days = @time_elps_seconds/60/60/24
    @weeks = @time_elps_seconds/60/60/24/7
    @years = @time_elps_seconds/60/60/24/365.25
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    def variance(list_of_numbers)
        running_total=0
        list_of_numbers.each do |number|
            running_total = running_total +((@mean-number)**2)
        end
        return running_total/@count
    end

    def median_count(list_of_numbers)
        if list_of_numbers.count.odd
            @median_count=@count+0.5
        elsif list_of_numbers.count.even
            @median_count=@count
        end
        return @median_count
    end
    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = (@numbers.max)-(@numbers.min)

    @median = median_count(@sorted_numbers)

    @sum = @numbers.sum

    @mean = @sum/@count

    @variance = variance(@numbers)

    @standard_deviation = @variance**0.5

    @mode = "Replace this string with your answer."
  end
end
