class Appointment
    attr_accessor :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
      @location = location
      @purpose = purpose
      @hour = hour
      @min = min
    end
  end
  
  class MonthlyAppointment < Appointment
    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
      super(location, purpose, hour, min)
      @day = day
    end
  
    def occurs_on?(day)
      return (@day == day)? true : false
    end
  
    def to_s
      return "Reunión mensual en #{@location} sobre #{purpose} el día #{@day} a la(s) #{@hour}:#{@min}"
    end
  end
  
  class DailyAppointment < Appointment
    def occurs_on?(hour, min) 
      return (@hour == hour && @min == min)? true : false
    end
  
    def to_s
      return "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}"
    end
  end
  
  class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
      super(location, purpose, hour, min)
      @day = day
      @month = month
      @year = year
    end
  
    def occurs_on?(day, month, year)
      return (@day == day && @month == month && @year == year)? true : false
    end
  
    def to_s
      return "Reunion única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end
  end
  
  
  a1 = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
  a2 = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
  a3 = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
  
  puts a1
  puts a2
  puts a3
  
  puts a1.occurs_on?(4,6,2019)
  puts a1.occurs_on?(12,9,2020)
  
  puts a2.occurs_on?(8,15)
  puts a2.occurs_on?(1,30)
  
  puts a3.occurs_on?(23)
  puts a3.occurs_on?(30)