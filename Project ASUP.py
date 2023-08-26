import datetime
import mysql.connector
from tkinter import *


todate = datetime.date.today()
today = datetime.datetime.today().weekday()
days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
print(todate, days[today], end='\n')

l_staff_on_leave = []

# asking for
# {no. of teachers} on leave
staff_on_leave = int(input('Please enter the number of teachers on leave:'))

# input of teacher(s)[full name] on leave
for i in range(1, staff_on_leave + 1):
    name_of_staff = input('Please enter the full name of Teacher ' + str(i) + ':')
    l_staff_on_leave.append(name_of_staff.upper())
print(l_staff_on_leave)
# import the SQL database
sqltor = mysql.connector.connect(host='localhost', user='root', passwd='localhost', database='ASUP',
                                  auth_plugin='mysql_native_password')
cursor = sqltor.cursor()
cursor.execute('SHOW TABLES;')
the_tables = cursor.fetchall()
all_teachers = []
for table in the_tables:
    all_teachers.append(table)
    # it has 10 tables with each table named with the teachers [full name]
# select all the tables
# select the row according to {day variable} which is column no.1 in SQL table
substitution_list = {}


def substitute(absentees):
    read_table = sqltor.cursor()
    selecting = "SELECT PERIOD_DAYS, {} " \
                "FROM {} ;".format(days[today].upper(), absentees)
    read_table.execute(selecting)
    name_and_period = read_table.fetchall()
    for each_period in name_and_period:
        if each_period[1] is None:
            continue
        else:
            teacher_not_free_period = each_period[0]
            found_substitute = False
            for other_teachers_tuple in all_teachers:
                if found_substitute:
                    break
                other_teachers = other_teachers_tuple[0]
                if other_teachers == absentees or other_teachers in assigned_substitutes or \
                        other_teachers.upper() in l_staff_on_leave:
                    continue
                else:
                    read_other_teacher = sqltor.cursor()
                    selecting_other_teacher = "SELECT PERIOD_DAYS, {} " \
                                              "FROM {} ;".format(days[today].upper(), other_teachers)
                    read_other_teacher.execute(selecting_other_teacher)
                    name_and_period_of_other_teacher = read_other_teacher.fetchall()
                    for epiot in name_and_period_of_other_teacher:
                        if epiot[0] == teacher_not_free_period and epiot[1] is None:
                            if absentees not in substitution_list:
                                substitution_list[absentees] = []
                            substitution_list[absentees].append((other_teachers, epiot[0]))
                            assigned_substitutes.add(other_teachers)
                            found_substitute = True
                            break
                        else:
                            continue


assigned_substitutes = set()
for i in l_staff_on_leave:
    substitute(i)

'''print("All teachers:", all_teachers)
print("Teachers on leave:", l_staff_on_leave)
print("Substitution list:", substitution_list)'''


window = Tk()
window.geometry("800x800")
window.title("Substitution List")

# Set background color
window.configure(bg="lightgreen")


def show_date():
    now = datetime.datetime.now()
    date = now.strftime("%Y-%m-%d")
    day = now.strftime("%A")
    date_label.config(text=f"Today is {day}, {date}")


# Create date label
date_label = Label(window, font=("Times New Roman", 16), bg="lightgreen", fg="black")
date_label.pack(pady=20)

show_date()

# Create frame for table
table_frame = Frame(window)
table_frame.pack(pady=20)

# Create table headers
header_font = ("Times New Roman", 14, "bold")
header_bg = "lightgreen"
header_fg = "black"

Label(table_frame, text="Absent Teacher", font=header_font, bg=header_bg, fg=header_fg, width=25).grid(row=0, column=0)
Label(table_frame, text="Substitute Teacher", font=header_font, bg=header_bg, fg=header_fg, width=25).grid(row=0, column=1)
Label(table_frame, text="Class", font=header_font, bg=header_bg, fg=header_fg, width=15).grid(row=0, column=2)

# Add table data
row_font = ("Times New Roman", 12)
row_colors = ["white", "lightgrey"]

row = 1
for absent_teacher, substitutes in substitution_list.items():
    for substitute in substitutes:
        Label(table_frame, text=absent_teacher, font=row_font, bg=row_colors[row % 2], width=25).grid(row=row, column=0)
        Label(table_frame, text=substitute[0].upper(), font=row_font, bg=row_colors[row % 2], width=25).grid(row=row,
                                                                                                           column=1)
        Label(table_frame, text=substitute[1], font=row_font, bg=row_colors[row % 2], width=15).grid(row=row, column=2)
        row += 1

window.mainloop()
sqltor.close()
