pr <- plumber::plumb("ernie_api.R")
pr$run(host="0.0.0.0", port=8000)
