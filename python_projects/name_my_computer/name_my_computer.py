from tkinter import *
from tkinter import messagebox
import os


window = Tk()
window.title("Set your computers name")
window.geometry('350x200')

lbl = Label(window, text="Enter name: ")
lbl.grid(column=0, row=0)

c_name = Entry(window,width=10)
c_name.grid(column=1, row=0)

def clicked():
    messagebox.showinfo("Message title", f" setting name to: \"{c_name.get()}\"" )
    os.system("scutil --set HostName " + c_name.get())
    os.system("scutil --set LocalHostName " + c_name.get())
    os.system("scutil --set ComputerName " + c_name.get())


btn = Button(window, text="Click Me", command=clicked)
btn.grid(column=2, row=0)


window.mainloop()


