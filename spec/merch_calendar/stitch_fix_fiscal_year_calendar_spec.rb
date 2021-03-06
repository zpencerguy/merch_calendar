require "spec_helper"

RSpec.describe MerchCalendar::StitchFixFiscalYearCalendar do
  describe "#weeks_in_year" do
    it "returns 53 for a leap year - 2013" do
      expect(subject.weeks_in_year(2013)).to eq 53
    end

    it "returns 52 for a normal year - 2014" do
      expect(subject.weeks_in_year(2014)).to eq 52
    end

    it "returns 52 for a normal year - 2015" do
      expect(subject.weeks_in_year(2015)).to eq 52
    end

    it "returns 52 for a normal year - 2016" do
      expect(subject.weeks_in_year(2016)).to eq 52
    end

    it "returns 52 for a normal year - 2017" do
      expect(subject.weeks_in_year(2017)).to eq 52
    end

    it "returns 52 for a normal year - 2018" do
      expect(subject.weeks_in_year(2018)).to eq 52
    end

    it "returns 53 for a year that includes a 4-5-5 quarter - 2019" do
      expect(subject.weeks_in_year(2019)).to eq 53
    end
    
    it "returns 52 for a normal year - 2020" do
      expect(subject.weeks_in_year(2023)).to eq 52
    end
    
    it "returns 53 for a year that includes a 4-5-5 quarter - 2024" do
      expect(subject.weeks_in_year(2024)).to eq 53
    end
    
    it "returns 52 for a normal year - 2025" do
      expect(subject.weeks_in_year(2025)).to eq 52
    end
  end

  describe "#start_of_week" do
    it "returns the correct date for 2017-1-1 (2017-Aug-wk1)" do
      expect(subject.start_of_week(2017, 1, 1)).to eq Date.new(2016, 7, 31)
    end

    it "returns the correct Date for 2018-1-1 (2018-Aug-wk1)" do
      expect(subject.start_of_week(2018, 1, 1)).to eq Date.new(2017, 7, 30)
    end

    it "returns the correct Date for 2019-1-1 (2019-Aug-wk1)" do
      expect(subject.start_of_week(2019, 1, 1)).to eq Date.new(2018, 7, 29)
    end
    
    it "returns the correct Date for 2020-1-1 (2020-Aug-wk1)" do
      expect(subject.start_of_week(2020, 1, 1)).to eq Date.new(2019, 8, 4)
    end
  end

  describe "#end_of_week" do
    it "returns the correct date for 2017-6-1 (2017-Jan-wk1)" do
      expect(subject.end_of_week(2017, 6, 1)).to eq Date.new(2017, 1, 7)
    end

    it "returns the correct Date for 2018-6-4 (2018-Jan-wk4)" do
      expect(subject.end_of_week(2018, 6, 4)).to eq Date.new(2018, 1, 27)
    end

    it "returns the correct Date for 2019-10-3 (2019-May-wk3)" do
      expect(subject.end_of_week(2019, 10, 3)).to eq Date.new(2019, 5, 18)
    end
    
    it "returns the correct Date for 2019-12-5 (2019-Jul-wk5)" do
      expect(subject.end_of_week(2019, 12, 5)).to eq Date.new(2019, 8, 3)
    end
    
    it "returns the correct Date for 2020-2-5 (2020-Sept-wk5)" do
      expect(subject.end_of_week(2020, 2, 5)).to eq Date.new(2019, 10, 5)
    end
  end

  describe "#start_of_month" do
    it "returns the correct date for 2018-1 AKA 2018-Aug" do
      expect(subject.start_of_month(2018, 1)).to eq Date.new(2017, 7, 30)
    end

    it "returns the correct date for 2019-1 AKA 2019-Aug" do
      expect(subject.start_of_month(2019, 1)).to eq Date.new(2018, 7, 29)
    end
    
    it "returns the correct date for 2019-1 AKA 2019-Aug" do
      expect(subject.start_of_month(2020, 1)).to eq Date.new(2019, 8, 4)
    end
  end

  describe "#end_of_month" do
    it "returns the correct date for 2018-1 AKA 2018-Aug" do
      expect(subject.end_of_month(2018, 1)).to eq Date.new(2017, 8, 26)
    end

    it "returns the correct date for 2019-1 AKA 2019-Aug" do
      expect(subject.end_of_month(2019, 1)).to eq Date.new(2018, 8, 25)
    end
    
    it "returns the correct date for 2020-1 AKA 2020-Aug" do
      expect(subject.end_of_month(2020, 1)).to eq Date.new(2019, 8, 31)
    end
    
    it "returns the correct date for 2020-12 AKA 2020-July" do
      expect(subject.end_of_month(2020, 12)).to eq Date.new(2020, 8, 1)
    end
  end

  describe "#start_of_quarter" do
    it "returns the correct date for 2018-Q1" do
      expect(subject.start_of_quarter(2018, 1)).to eq Date.new(2017, 7, 30)
    end

    it "returns the correct date for 2018-Q4" do
      expect(subject.start_of_quarter(2018, 4)).to eq Date.new(2018, 4, 29)
    end

    it "returns the correct date for 2019-Q1" do
      expect(subject.start_of_quarter(2019, 1)).to eq Date.new(2018, 7, 29)
    end
    
    it "returns the correct date for 2019-Q2" do
      expect(subject.start_of_quarter(2019, 2)).to eq Date.new(2018, 10, 28)
    end
    
    it "returns the correct date for 2019-Q3" do
      expect(subject.start_of_quarter(2019, 3)).to eq Date.new(2019, 1, 27)
    end
    
    it "returns the correct date for 2020-Q4" do
      expect(subject.start_of_quarter(2020, 4)).to eq Date.new(2020, 5, 3)
    end
    
    it "raises an error when there is an invalid quarter" do
      expect { subject.start_of_quarter(2019, 5) }.to raise_error "invalid quarter"
    end
  end

  describe "#end_of_quarter" do
    it "returns the correct date for 2018-Q1" do
      expect(subject.end_of_quarter(2018, 1)).to eq Date.new(2017, 10, 28)
    end

    it "returns the correct date for 2018-Q4" do
      expect(subject.end_of_quarter(2018, 4)).to eq Date.new(2018, 7, 28)
    end

    it "returns the correct date for 2019-Q1" do
      expect(subject.end_of_quarter(2019, 1)).to eq Date.new(2018, 10, 27)
    end
    
    it "returns the correct date for 2019-Q2" do
      expect(subject.end_of_quarter(2019, 2)).to eq Date.new(2019, 1, 26)
    end
    
    it "returns the correct date for 2019-Q3" do
      expect(subject.end_of_quarter(2019, 3)).to eq Date.new(2019, 4, 27)
    end
    
    it "returns the correct date for 2020-Q4" do
      expect(subject.end_of_quarter(2020, 4)).to eq Date.new(2020, 8, 1)
    end
    
    it "raises an error when there is an invalid quarter" do
      expect { subject.end_of_quarter(2019, 5) }.to raise_error "invalid quarter"
    end
  end

  describe "#quarter" do
    it "returns the correct quarter number" do
      expect(subject.quarter(5)).to eq 2
      expect(subject.quarter(7)).to eq 3
      expect(subject.quarter(2)).to eq 1
      expect(subject.quarter(11)).to eq 4
    end

    it "raises an error when there is an invalid merch month" do
      expect { subject.quarter(13) }.to raise_error "invalid merch month"
    end
  end

  describe "#season" do
    context "returns Fall/Winter from its merch_month" do
      it { expect(subject.season(1)).to eq "Fall/Winter" }
      it { expect(subject.season(2)).to eq "Fall/Winter" }
      it { expect(subject.season(3)).to eq "Fall/Winter" }
      it { expect(subject.season(4)).to eq "Fall/Winter" }
      it { expect(subject.season(5)).to eq "Fall/Winter" }
      it { expect(subject.season(6)).to eq "Fall/Winter" }
    end
    
    context "returns Spring Summer from its merch_month" do
      it { expect(subject.season(7)).to eq "Spring/Summer" }
      it { expect(subject.season(8)).to eq "Spring/Summer" }
      it { expect(subject.season(9)).to eq "Spring/Summer" }
      it { expect(subject.season(10)).to eq "Spring/Summer" }
      it { expect(subject.season(11)).to eq "Spring/Summer" }
      it { expect(subject.season(12)).to eq "Spring/Summer" }
    end

    it "raises an error when there is an invalid merch month" do
      expect { subject.season(13) }.to raise_error "invalid merch month"
    end
  end

  describe "#start_of_year" do
    it "returns the correct date for 2018" do
      expect(subject.start_of_year(2018)).to eq Date.new(2017, 7, 30)
    end

    it "returns the correct date for 2019" do
      expect(subject.start_of_year(2019)).to eq Date.new(2018, 7, 29)
    end
    
    it "returns the correct date for 2020" do
      expect(subject.start_of_year(2020)).to eq Date.new(2019, 8, 4)
    end
    
    it "returns the correct date for 2024, the next 53-week year" do
      expect(subject.start_of_year(2024)).to eq Date.new(2023, 7, 30)
    end
    
    it "returns the correct date for 2025, the next year after the 53-week year" do
      expect(subject.start_of_year(2025)).to eq Date.new(2024, 8, 4)
    end
  end

  describe "#end_of_year" do
    it "returns the correct date for 2017" do
      expect(subject.end_of_year(2017)).to eq Date.new(2017, 7, 29)
    end

    it "returns the correct date for 2018" do
      expect(subject.end_of_year(2018)).to eq Date.new(2018, 7, 28)
    end

    it "returns the correct date for 2019" do
      expect(subject.end_of_year(2019)).to eq Date.new(2019, 8, 3)
    end
    
    it "returns the correct date for 2020" do
      expect(subject.end_of_year(2020)).to eq Date.new(2020, 8, 1)
    end
    
    it "returns the correct date for 2024, the next 53-week year" do
      expect(subject.end_of_year(2024)).to eq Date.new(2024, 8, 3)
    end
    
    it "returns the correct date for 2025, the next year after the 53-week year" do
      expect(subject.end_of_year(2025)).to eq Date.new(2025, 8, 2)
    end
  end
  
  describe "#merch_year_from_date" do
    it "converts julian dates to its fiscal year" do
      expect(subject.merch_year_from_date(Date.new(2018, 7, 24))).to eq 2018
      expect(subject.merch_year_from_date(Date.new(2018, 7, 29))).to eq 2019
      expect(subject.merch_year_from_date(Date.new(2018, 8, 1))).to eq 2019
      expect(subject.merch_year_from_date(Date.new(2019, 8, 1))).to eq 2019
      expect(subject.merch_year_from_date(Date.new(2019, 8, 4))).to eq 2020
      expect(subject.merch_year_from_date(Date.new(2024, 2, 3))).to eq 2024
      expect(subject.merch_year_from_date(Date.new(2024, 7, 30))).to eq 2024
      expect(subject.merch_year_from_date(Date.new(2024, 8, 4))).to eq 2025
    end
  end

  
  describe "#merch_months_in" do
    it "returns merch date for start_date if start_date is the same as end_date" do
      start_date = Date.new(2020,8,2)
      end_date = start_date
      start_merch_date = subject.start_of_month(start_date.year, start_date.month)
    
      merch_months = subject.merch_months_in(start_date, end_date)
    
      expect(merch_months.count).to be(1)
      expect(merch_months[0].strftime('%Y-%m-%d')).to eq '2020-08-02'
    end
    
    it "returns valid merch dates for FY 2019" do
      start_date = Date.new(2018, 8, 1)
      end_date = Date.new(2019, 8, 1)
    
      merch_months = subject.merch_months_in(start_date, end_date)

      expect(merch_months.count).to be 13
    
      expect(merch_months[0].year).to be 2018
      expect(merch_months[6].year).to be 2019
      expect(merch_months[12].year).to be 2019

      expect(merch_months[0].strftime('%Y-%m-%d')).to eq  '2018-07-29'
      expect(merch_months[1].strftime('%Y-%m-%d')).to eq  '2018-08-26'
      expect(merch_months[2].strftime('%Y-%m-%d')).to eq  '2018-09-30'
      expect(merch_months[3].strftime('%Y-%m-%d')).to eq  '2018-10-28'
      expect(merch_months[4].strftime('%Y-%m-%d')).to eq  '2018-11-25'
      expect(merch_months[5].strftime('%Y-%m-%d')).to eq  '2018-12-30'
      expect(merch_months[6].strftime('%Y-%m-%d')).to eq  '2019-01-27'
      expect(merch_months[7].strftime('%Y-%m-%d')).to eq  '2019-02-24'
      expect(merch_months[8].strftime('%Y-%m-%d')).to eq  '2019-03-31'
      expect(merch_months[9].strftime('%Y-%m-%d')).to eq  '2019-04-28'
      expect(merch_months[10].strftime('%Y-%m-%d')).to eq '2019-05-26'
      expect(merch_months[11].strftime('%Y-%m-%d')).to eq '2019-06-30'
      expect(merch_months[12].strftime('%Y-%m-%d')).to eq '2019-08-04'
    end
  end

  describe "#julian_to_merch" do
    it "converts julian months to merch months" do
      expect(subject.julian_to_merch(8)).to eq 1
      expect(subject.julian_to_merch(9)).to eq 2
      expect(subject.julian_to_merch(10)).to eq 3
      expect(subject.julian_to_merch(11)).to eq 4
      expect(subject.julian_to_merch(12)).to eq 5
      expect(subject.julian_to_merch(1)).to eq 6
      expect(subject.julian_to_merch(2)).to eq 7
      expect(subject.julian_to_merch(3)).to eq 8
      expect(subject.julian_to_merch(4)).to eq 9
      expect(subject.julian_to_merch(5)).to eq 10
      expect(subject.julian_to_merch(6)).to eq 11
      expect(subject.julian_to_merch(7)).to eq 12
      expect { subject.julian_to_merch(13) }.to raise_error ArgumentError
      expect { subject.julian_to_merch(0) }.to raise_error ArgumentError
    end
  end

  describe "#merch_to_julian" do
    it "converts merch months to julian months" do
      expect(subject.merch_to_julian(1)).to eq 8
      expect(subject.merch_to_julian(2)).to eq 9
      expect(subject.merch_to_julian(3)).to eq 10
      expect(subject.merch_to_julian(4)).to eq 11
      expect(subject.merch_to_julian(5)).to eq 12
      expect(subject.merch_to_julian(6)).to eq 1
      expect(subject.merch_to_julian(7)).to eq 2
      expect(subject.merch_to_julian(8)).to eq 3
      expect(subject.merch_to_julian(9)).to eq 4
      expect(subject.merch_to_julian(10)).to eq 5
      expect(subject.merch_to_julian(11)).to eq 6
      expect(subject.merch_to_julian(12)).to eq 7
      expect { subject.merch_to_julian(13) }.to raise_error ArgumentError
      expect { subject.merch_to_julian(0) }.to raise_error ArgumentError
    end
  end

  describe "#weeks_for_month" do
    context "correct number of weeks given julian month and fiscal year" do
      it "returns 4 weeks for a 4-week month Fiscal Year 2019 for Aug" do
        weeks = subject.weeks_for_month(2019, 8)
        expect(weeks.size).to eq 4
      end

      it "returns 5 weeks for a 5-week month Fiscal Year 2019 for Sept" do
        weeks = subject.weeks_for_month(2019, 9)
        expect(weeks.size).to eq 5
      end

      it "returns 5 weeks during a 4-5-5 quarter" do
        weeks = subject.weeks_for_month(2019, 5)
        expect(weeks.size).to eq 4

        weeks = subject.weeks_for_month(2019, 6)
        expect(weeks.size).to eq 5
        
        weeks = subject.weeks_for_month(2019, 7)
        expect(weeks.size).to eq 5
        
        weeks = subject.weeks_for_month(2020, 8)
        expect(weeks.size).to eq 4
      end
    end
  end
end
