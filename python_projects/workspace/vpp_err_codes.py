import requests

url = "https://vpp.itunes.apple.com/WebObjects/MZFinance.woa/wa/VPPServiceConfigSrv"

response = requests.get(url, headers={"Accept": "application/json"}).json()


def vpp_error_code_meaning():
	for error_code in response["errorCodes"]:
		for key, value in error_code.items():
			if key == "errorMessage":
				err_msg = value
			elif key == "errorNumber":
				err_code = value
		print(f"The code {err_code} is equal to {err_msg} ")


vpp_error_code_meaning()