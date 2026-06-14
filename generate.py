import csv
import random
import os
import sys

NUM_ROWS = 50

COLUMNS = ["Имя", "Возраст", "Вес", "Разряд"]

def generate_row():

    return {
        "Имя": random.choice(["Алексей", "Мария", "Дмитрий", "Анна", "Сергей", "Ольга", "Иван", "Елена"]),
        "Возраст": random.randint(18, 60),
        "Вес": round(random.uniform(50, 110), 2),
        "Разряд": random.choice(["III разряд", "II разряд", "I разряд", "КМС"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

