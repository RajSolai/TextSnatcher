import subprocess

langs = ['tam','eng','hin','jpn','rus','fra','tha','ara','chi_sim','spa', 'ind']

for lang in langs :
    file_url = 'https://github.com/tesseract-ocr/tessdata_best/raw/main/'+lang+'.traineddata'
    subprocess.run(['wget',file_url,'-P','/tmp'])

for lang in langs :
    file_path = '/tmp/'+lang+'.traineddata'
    subprocess.run(['sha256sum',file_path])
    