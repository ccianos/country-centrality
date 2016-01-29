import util
import time
import sys

m = ['54.192.224.82', '54.239.142.174', '54.239.142.179', '54.230.103.230', '23.220.148.27', '23.220.148.26', '54.230.103.237', '54.239.142.176', '23.206.119.94', '199.16.156.73', '199.16.156.230', '173.252.74.68', '199.16.156.75', '52.84.27.52', '177.135.107.170', '177.135.107.173', '177.135.107.172', '177.135.107.177', '52.84.27.55', '173.194.119.9', '173.194.119.8', '54.230.226.189', '173.194.119.5', '173.194.119.4', '173.194.119.7', '173.194.119.6', '173.194.119.1', '173.194.119.0', '173.194.119.3', '173.194.119.2', '216.58.217.142', '23.6.234.73', '201.82.12.10', '23.52.152.239', '31.13.73.49', '23.52.153.219', '54.230.103.128', '66.150.48.39', '201.157.202.3', '54.230.103.51', '54.230.103.56', '54.239.152.6', '23.220.148.24', '184.85.138.71', '200.216.8.11', '23.203.112.206', '69.28.187.40', '201.82.108.94', '201.82.108.93', '69.28.187.47', '65.55.65.28', '69.28.187.48', '201.82.108.98', '201.82.108.99', '64.233.190.105', '173.194.118.57', '64.233.190.106', '64.233.190.101', '64.233.190.100', '64.233.190.103', '64.233.190.102', '173.194.118.58', '74.125.226.191', '69.28.187.119', '104.90.79.72', '104.244.42.129', '88.221.33.226', '74.125.224.128', '74.125.224.129', '69.164.38.188', '189.6.45.9', '23.208.108.193', '54.192.59.110', '201.16.134.49', '201.16.134.48', '89.184.84.2', '201.16.134.43', '54.192.225.182', '201.16.134.41', '201.16.134.40', '54.240.170.184', '54.240.170.186', '201.6.5.40', '208.111.135.200', '54.192.160.251', '52.84.29.196', '190.98.140.138', '190.98.140.139', '23.62.186.208', '54.230.225.150', '23.37.67.72', '54.230.225.155', '189.124.133.167', '54.230.225.159', '54.192.53.116', '23.206.162.218', '72.246.216.244', '23.6.234.91', '54.192.192.156', '69.31.21.81', '69.31.21.83', '96.17.34.103', '66.198.24.250', '54.231.18.104', '52.84.27.104', '205.251.223.206', '205.251.223.202', '23.218.126.196', '54.230.205.84', '205.251.223.208', '104.94.198.229', '200.123.199.17', '54.231.18.0', '205.251.223.225', '54.231.18.8', '72.247.64.85', '54.230.162.243', '54.230.162.240', '205.251.223.227', '104.73.28.97', '23.195.148.51', '69.164.27.80', '216.58.222.35', '204.2.187.80', '204.2.187.82', '72.21.81.200', '72.246.97.34', '72.246.97.35', '74.125.226.179', '74.125.226.178', '72.246.97.32', '72.246.97.33', '74.125.226.175', '74.125.226.177', '74.125.226.176', '208.111.161.129', '189.86.122.160', '189.86.122.162', '189.86.122.163', '72.247.9.122', '72.247.9.123', '72.247.9.120', '189.86.122.168', '189.86.122.169', '104.73.49.230', '72.247.9.129', '192.16.58.25', '23.195.242.47', '54.230.52.159', '216.58.192.78', '184.24.92.7', '54.230.52.151', '65.55.65.172', '54.230.195.245', '54.239.142.74', '54.192.193.225', '54.192.193.220', '177.43.198.20', '74.217.63.20', '74.217.63.21', '23.45.27.120', '74.217.63.23', '74.217.63.24', '23.62.7.19', '205.251.223.191', '205.251.223.190', '74.217.63.28', '74.217.63.29', '198.136.52.36', '205.251.223.199', '205.251.223.198', '104.20.1.4', '23.206.146.194', '54.192.161.232', '187.7.117.44', '187.7.117.45', '54.230.195.42', '187.7.117.40', '66.150.118.46', '141.0.174.40', '54.230.116.109', '107.21.230.14', '184.27.24.33', '187.7.117.49', '54.230.163.171', '54.230.206.78', '54.230.163.177', '74.125.29.139', '69.164.27.160', '69.31.132.136', '200.147.15.208', '23.8.19.222', '54.230.160.198', '205.251.251.153', '54.192.54.82', '54.192.54.84', '205.251.251.159', '54.192.54.86', '201.17.165.182', '201.17.165.183']

measurement_ids = util.run_traceroute_measurements(m, "ICMP")
print measurement_ids
f = open('testing_lots_of_traces.txt', 'w')
f.write(str(m) + "\n")
f.write(str(measurement_ids) + "\n")

time.sleep(900) # may be the missing piece
measurement_ids = util.run_traceroute_measurements(m, "TCP")
print measurement_ids

f.write(str(measurement_ids) + "\n")

traces = util.analyze_traceroutes(measurement_ids)
f.write(str(traces) + "\n")
f.close()
