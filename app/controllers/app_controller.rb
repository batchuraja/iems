class AppController < ApplicationController
  def index
  end

  def date_select
  	@buildings = Building.all
  	#@building=params[:query][:building]
  	#@parameter=params[:query][:parameter]
  	#@datetimes=params[:query][:dateTimeStart]
  	
  	if (params.has_key?(:dateTimeStart) && params.has_key?(:dateTimeEnd))
	    t1 = ""
	    a = params[:dateTimeStart].to_a
	    t1 = t1 + a[2][1].to_s + "-" + a[1][1].to_s + "-" + a[0][1].to_s + " " + a[3][1].to_s + ":" + a[4][1].to_s
	    t1 = Time.parse( t1 ).to_i
	    a = []
	    a = params[:dateTimeEnd].to_a
	    t2 = ""
	    t2 = t2 + a[2][1].to_s + "-" + a[1][1].to_s + "-" + a[0][1].to_s + " " + a[3][1].to_s + ":" + a[4][1].to_s
	    t2 = Time.parse( t2 ).to_i
	    tm = []
	    t=t1
	    while t < t2
	      tm.push(t)
	      t= t+3600
	    end

	    readable_times = tm.map{ |time| Time.at(time) }
	    tdy = readable_times[0].day
	    i=0
	    readable_times.each do | ntym |
	      if ntym.day != tdy
	        tdy = ntym.day
	        readable_times[i] = readable_times[i].strftime("%d %H:%M")
	      elsif i%4 != 0
	        readable_times[i] = Time.at(t1)
	      else
	        readable_times[i] = readable_times[i].strftime("%d %H:%M")
	      end
	      i=i+1
	    end
	    tdy = Time.at(t1).to_s


	    a =readable_times.to_s
	    a.gsub!('[','')
	    a.gsub!(']','')
	    a.gsub!(tdy,'')
	    @label = a.split(',')
	end

	
	@tag1 = params[:query][:building1]
	@tag2 = params[:query][:building2]
	
	if(params.has_key?(:query) && params.has_key?(:parameter))
	  	case params[:query][:parameter]
	  	when 'Energy'
	  		render('plotter/energy_plot')

	  	when 'Instantaneous Power'
	  		render('plotter/power_plot')
	  		
	  	when 'RMS Voltage'
	  		render('plotter/rmsvoltage_plot')
	  	
	  	when 'Line Frequency'
	  		render('plotter/freq_plot')
	  	
	  	when 'Power Factor'
	  		render('plotter/pf_plot')
	  	end
	end

  end
  
  def plot
  	

  end

end
