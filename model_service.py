from os import path
import traceback
from database.common import *
from database.db_manager import DBManager


"""
Create an API for prediction

1. Get the answer choices from frontend and pass to model as a feature
2. Use that to predict the number
3. Use that number to filter all the content by category - Can be done using the Content_services page then
"""

