import pandas as pandas
from selenium import webdriver
from selenium.webdriver.support.ui import Select

driver = webdriver.Firefox() # chrome
driver.get('url')

select = Select(driver.find_element_by_id('Quality'))

# select by visible text
select.select_by_visible_text('test plan')
# select by value
select.select_by_value('num') # num = div value

select_test_plan = Select(driver.find_element_by_id('TF813')) # hardcode
select_test_plan.select_by_visible_text('ITEM mASTER - Test Scenario')

'''
similar navigation till we download the cvs file.
'''

df = pandas.load()
# df.coloums[]
# select unique test case
# select latest test run
# use plt to show pie chart(last verdict). 
