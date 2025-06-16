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
