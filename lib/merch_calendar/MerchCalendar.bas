Attribute VB_Name = "MerchCalendar"
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' CREDIT:                                                                                                '
' Coding logic/ comments built using Stitchfix's 'merch_calendar' tool under the open source MIT License '
' https://github.com/stitchfix/merch_calendar                                                            '
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'The last date of the retail year
'
'@param year [Integer] the retail year
'@return [Date] the last date of the retail year
Function end_of_year(year)
    Dim year_end As Date
    Dim wday As Integer
    
    year_end = DateSerial((year + 1), 1, 31) 'Jan 31st
    wday = Weekday(year_end) - 1 'minus one for index of 0 from Sun
    wday = Weekday(year_end) Mod 7
    
    If wday > 3 Then
        year_end = year_end + (7 - wday)
    Else
        year_end = year_end - wday
    End If
    
    end_of_year = year_end
End Function
'The first date of the retail year
'
'@param year [Integer] the retail year
'@return [Date] the first date of the retail year
Function start_of_year(year)
    start_of_year = end_of_year(year - 1) + 1
End Function
'The starting date of the given merch month
'
'@param year [Integer] the retail year
'@param merch_month [Integer] the nth merch month of the retail calendar
'@return [Date] the start date of the merch month
Function start_of_month(year, merch_month)
    Dim n_weeks As Integer
    Dim m_start As Date
    
    m_start = start_of_year(year) + (Int((merch_month - 1) / 3) * 91) '91 = number of days in a single 4-5-4 set
    'Debug.Print (m_start)
    n_weeks = weeks_in_month(merch_month)
    'Debug.Print (n_weeks)
    
    Select Case n_weeks
        Case Is = 4
            '28 = 4 weeks
            m_start = m_start + 28
        Case Is = 5
            '63 = 4 weeks + 5 weeks
            m_start = m_start + 63
    End Select
    
    start_of_month = m_start
End Function
'The ending date of the given merch month
'
'@param year [Integer] the retail year
'@param merch_month [Integer] the nth merch month of th retail calendar
'@return [Date] the end date of the merch month
Function end_of_month(year, merch_month)
    If merch_month = 12 Then
        end_of_month = end_of_year(year)
    Else
        end_of_month = start_of_month(year, merch_month + 1) - 1
    End If
End Function
'Returns the date that corresponds to the first day in the merch week
'
'@param year [Integer] the retail year
'@param month [Integer] the nth merch month of the retail calendar
'@param merch_week [Integer] the nth week of the merch month
'@return [Date] the start date of the merch week
Function start_of_week(year, month, merch_week)
    start_of_week = start_of_month(year, month) + ((merch_week - 1) * 7)
End Function
'Returns the date that corresponds to the last day in the merch week
'
'@param year [Integer] the retail year
'@param month [Integer] the nth merch month of the retail calendar
'@param merch_week [Integer] the nth week of the merch month
'@return [Date] the end date of the merch week
Function end_of_week(year, month, merch_week)
    end_of_week = start_of_month(year, month) + (6 + ((merch_week - 1) * 7))
End Function
'The position of month in the 4-5-4 calander used to calculate start_of_month
'
'@param month [Integer] the nth merch_month of the reatil calendar
'@return number of weeks [Integer] in the month position of the 4-5-4 calendar
Function weeks_in_month(month As Variant)
    Dim four_week_arry As Variant
    Dim five_week_arry As Variant
    
    four_week_arry = Array(2, 5, 8, 11)
    five_week_arry = Array(3, 6, 9, 12)
    
    If month > 12 Then
        MsgBox ("Check Merch Month")
    Else
        For Each num In four_week_arry
            If num = month Then
                weeks_in_month = 4
                Exit Function
            End If
        Next num
        For Each num In five_week_arry
            If num = month Then
                weeks_in_month = 5
                Exit Function
            End If
        Next num
    End If
End Function
