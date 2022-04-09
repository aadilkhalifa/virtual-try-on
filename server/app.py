from flask import Flask
from flask import request
from main import *
import os
from csv import writer

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def hello():
  if request.method == 'GET':
    return 'GET request'
  
  if request.method == 'POST':
    # return request.form['image']
    return main(request.form['image'])

@app.route("/image", methods=["POST"])
def get_image():
  
  if request.method == 'POST':
    image = request.files["img"]
    image.save(os.path.join(os.getcwd(), 'new.jpeg'))
    return main(os.path.join(os.getcwd(), 'new.jpeg'))

@app.route("/form", methods=["POST"])
def get_form():
  
  if request.method == 'POST':
    data = [
      request.form.get('field1'),
      request.form.get('field2'),
      request.form.get('field3'),
      request.form.get('field4'),
      request.form.get('field5'),
    ]
    print(data)
    # s = ''
    # for a in data:
    #   s += a + ' '

    with open('data.csv', 'a', newline='') as f_object:  
      # Pass the CSV  file object to the writer() function
      writer_object = writer(f_object)
      # Result - a writer object
      # Pass the data in the list as an argument into the writerow() function
      writer_object.writerow(data)  
      # Close the file object
      f_object.close()
    return request.form

if __name__ == "__main__":
  app.run()
