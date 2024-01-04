from tkinter import *
from PIL import ImageTk, Image
import datetime
import mysql.connector
import pandas as pd
from matplotlib.cbook import get_sample_data
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager

todate = datetime.date.today()
today = datetime.datetime.today().weekday()
days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
print(todate, days[today], end='\n')

l_staff_on_leave = []

root = Tk()

# Set window size and position
root.geometry('400x300')
root.eval('tk::PlaceWindow . center')

num_label = Label(root, text='Number of teachers on leave:')
num_label.pack()

num_entry = Entry(root)
num_entry.pack()


def submit():
    num_teachers = int(num_entry.get())
    num_label.pack_forget()
    num_entry.pack_forget()
    submit_button.pack_forget()

    teacher_labels = []
    teacher_entries = []
    for i in range(num_teachers):
        teacher_label = Label(root, text=f'Teacher {i + 1}:')
        teacher_label.pack()
        teacher_labels.append(teacher_label)

        teacher_entry = Entry(root)
        teacher_entry.pack()
        teacher_entries.append(teacher_entry)

    def done():
        for teacher_entry in teacher_entries:
            seperator = '_'
            l_staff_on_leave.append(seperator.join(teacher_entry.get().upper().split()))

        for teacher_label in teacher_labels:
            teacher_label.pack_forget()
        for teacher_entry in teacher_entries:
            teacher_entry.pack_forget()
        done_button.pack_forget()
        root.destroy()

    done_button = Button(root, text='Done', command=done)
    done_button.pack()


submit_button = Button(root, text='Submit', command=submit)
submit_button.pack()

root.mainloop()

sqltor = mysql.connector.connect(host='localhost', user='root', passwd='Iam@MYSQLwithAIML', database='ASUP',
                                 auth_plugin='mysql_native_password')
cursor = sqltor.cursor()
cursor.execute('SHOW TABLES;')
the_tables = cursor.fetchall()
all_teachers = []
for table in the_tables:
    all_teachers.append(table)

teacher_classes = {}
with open('teachers_classes.txt', 'r') as f:
    for line in f:
        teacher, classes = line.strip().split(':')
        classes = classes.split(',')
        teacher_classes[teacher] = classes

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
            the_period = each_period[1]
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
                            substitution_list[absentees].append((other_teachers, epiot[0], the_period))
                            assigned_substitutes.add(other_teachers)
                            found_substitute = True
                            break
                        else:
                            continue


assigned_substitutes = set()
for i in l_staff_on_leave:
    substitute(i)
print(substitution_list)

window = Tk()
window.attributes("-fullscreen", True)
window.title("Substitution List")
window.configure(bg="white")

from PIL import Image
image_to_open = Image.open("school logo.png")
photo = ImageTk.PhotoImage(image_to_open)

# Create a label to display the image and pack it at the top left of the window
image_label = Label(window, image=photo)
image_label.pack(pady=20)


def show_date():
    now = datetime.datetime.now()
    date = now.strftime("%Y-%m-%d")
    day = now.strftime("%A")
    date_label.config(text=f" {day}, {date}")


date_label = Label(window, font=("Times New Roman", 16), bg="white", fg="black")
date_label.pack(pady=20)

show_date()

header_font = ("Times New Roman", 14, "bold")
header_bg = "white"
header_fg = "Red"

row_font = ("Times New Roman", 10)
row_colors = ['lightgrey', 'lightgrey']

periods = ["Period 1", "Period 2", "Period 3", "Period 4", "Period 5",
           "Period 6", "Period 7", "Period 8"]

table_frame = Frame(window)
table_frame.pack(pady=40)
row = 1

# Create headers
for i in range(len(periods) + 1):
    if i == 0:
        Label(table_frame, text="Absent Teacher", font=header_font, bg=header_bg, fg=header_fg).grid(row=0,
                                                                                                     column=i * 2)
    else:
        Label(table_frame, text=periods[i - 1], font=header_font, bg=header_bg, fg=header_fg).grid(row=0, column=i * 2)
        Frame(table_frame, width=2, bg='black').grid(row=0, column=i * 2 - 1, rowspan=row + 1, sticky='ns')

# Create rows for absent teachers and their substitutes
row = 1
# Create a list of all periods
all_periods = ['Period {}'.format(i) for i in range(1, 9)]

# Create a new dictionary to store the data for the table
table_data = {'Absent Teacher': list(substitution_list.keys())}

for period in all_periods:
    table_data[period] = []

for absent_teacher, substitutes in substitution_list.items():
    Label(table_frame, text=absent_teacher.upper().replace('_', ' '), font=row_font, bg=row_colors[row % 2], wraplength=200).grid(row=row,
                                                                                                                column=0)
    # Create a dictionary to store substitutes for each period
    period_substitutes = {}
    for substitute in substitutes:
        period_index = int(substitute[1].split('_')[-1])  # Assuming period is in the format 'Period X'
        if period_index not in period_substitutes:
            period_substitutes[period_index] = []
        period_substitutes[period_index].append(substitute[0].upper())
        period_substitutes[period_index].append(substitute[2])
    print(period_substitutes) #######################
    # Create labels for all periods
    for i in range(1, len(periods) + 1):
        if i in period_substitutes:
            l = period_substitutes[i]

            def center_elements(l):
                length = len(l[0])
                # Center the second element within the length of the first
                centered = l[1].center(length)
                # Join the elements with a newline character
                result = '\n'.join([l[0].replace('_', ' '), centered])
                return result
            subs_text = center_elements(l)
        else:
            subs_text = 'FREE'  # Display 'NULL' if there are no substitutes for this period
        Label(table_frame, text=subs_text, font=row_font, bg=row_colors[row % 2], wraplength=200, anchor='n').grid(
            row=row, column=i * 2)
        Frame(table_frame, width=2, bg='black').grid(row=row + 1, column=i * 2 + 1)
        table_data[all_periods[i - 1]].append(subs_text)
    row += 1

print(table_data)

# Convert the new dictionary to a Pandas DataFrame
df = pd.DataFrame(table_data)
image_file = get_sample_data('E://Nishant//Programs//school logo.png')
image_file_2 = get_sample_data('E://Nishant//Programs//school bottom.png')
image = plt.imread(image_file)
image2 = plt.imread(image_file_2)

# Create a table using matplotlib
fig, ax = plt.subplots(1, 1)
ax.axis('tight')
ax.axis('off')
table = ax.table(cellText=df.values, colLabels=df.columns, loc='center')
ax2 = fig.add_axes([0.2, 0.5, 0.6, 0.7])    # [left, bottom, width, height]
ax3 = fig.add_axes([0.3, 0.01, 0.4, 0.3], anchor='S', zorder=-1)
ax2.imshow(image)
ax3.imshow(image2)
ax2.axis('off')
ax3.axis('off')

# Set the table properties
table.auto_set_font_size(False)
table.set_fontsize(10)
table.scale(1, 2)

# Set the grid and text colors
for key, cell in table.get_celld().items():
    cell.set_linewidth(0.5)
    cell.set_edgecolor('black')
    cell.set_text_props(color='blue')
    if key[0] == 0:
        cell.set_text_props(color='red')

    # Manually split long cell contents into multiple lines
    text = cell.get_text().get_text()
    if len(text) > 10:
        split_text = text.split(', ')
        wrapped_text = '\n'.join(split_text)
        cell.get_text().set_text(wrapped_text)

    cell.set_text_props(wrap=True)
    cell._text.set_fontproperties(font_manager.FontProperties(family='monospace'))
    cell.get_text().set_horizontalalignment('center')
    cell.set_width(0.25)

fig.tight_layout()
fig.set_size_inches(11, 8.5)
# Save the figure as a PDF file
plt.savefig(f'{todate}_substitution.pdf', bbox_inches='tight')

window.mainloop()
sqltor.close()
print('Substitution assigned successfully sir!')
