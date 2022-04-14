#!/usr/bin/python
from selenium import webdriver
from selenium.webdriver.firefox.options import Options

options = Options()
options.add_argument("--headless")

driver = webdriver.Firefox(firefox_options=options)
driver.get('file://<path>')

driver.save_screenshot('test.png')
