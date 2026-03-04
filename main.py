from util.reader import read_file
from util.parser import markdown_to_html

path = "~/Documents/obsidian/mount-olympus/Life Hub/ToDo/Task Printer.md"

md = read_file(path)

html = markdown_to_html(md)

print(html)