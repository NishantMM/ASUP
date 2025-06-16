# ASUP – Automated Substitution Program

**ASUP (Automated Substitution Program)** is a Python-based automation tool designed to help schools efficiently manage teacher substitutions. It uses Excel files to read teacher schedules and class group mappings, then generates a Word document listing eligible substitute teachers based on school-specific rules.

---

## 🚀 Features

- Reads and processes teacher timetable and group mapping from Excel files
- Automatically filters for:
  - Teachers with 2 or more free periods
  - Category-based teaching groups (6–8 and 9–12)
- Generates a ready-to-edit `.docx` file with substitution recommendations
- Designed to be easily customized for different institutions' needs (e.g., moral reasoning, priority teachers)
- Lightweight and doesn't require a complex database

---

## 📁 File Structure

```text
ASUP/
├── data/
│   ├── teachers_timetable.xlsx            # Input: Teacher period schedules
│   ├── teacher_group_mapping.xlsx         # Input: Class group assignments per teacher
├── output/
│   └── substitution_list.docx             # Output: Generated substitution list
├── main.py                                # Main logic script
├── README.md                              # Project documentation
└── requirements.txt                       # Python dependencies

 **Input Files (Excel Format)**
The program uses the following files from the data folder:

🔹 T_TIMETABLE.xlsx
Format: One worksheet per teacher

Each sheet:

Rows: Days of the week (Monday to Saturday)

Columns: Period 1 to Period 8

Cell content:

Blank → Free period

Otherwise → Subject-ClassSection (e.g., Math-6A, Sci-7B)

🔹 TMAP-Teachers-Classes.xlsx
A single-sheet Excel file mapping teacher codes and class groups.

Columns:

TCODE – Unique teacher ID (e.g., T102)

TNAME – Teacher's name (e.g., Anjali)

TCLASSES – Classes taught, as comma-separated values (e.g., 6,7)

⚠️ The real files are excluded for privacy. Sample files are provided in the data/ folder.
