import geoip2.database
import sys	

reader = geoip2.database.Reader('GeoIP2-City.mmdb')

def usage(code=1):
	sys.stderr.write('Usage: %s IPsList\n' % sys.argv[0])
	sys.exit()


def main():
    	if len(sys.argv) != 2:
        	usage()
	ips_file = sys.argv[1]

	ips={}
	with open(ips_file) as f:
   		for lines in f:
			try:
				ip=lines.strip()
				res=reader.city(ip)
				print "%s,%s,%s,%s,%f,%f" % (ip,res.country.name,res.subdivisions.most_specific.name,res.city.name,res.location.latitude,res.location.longitude)
			#	print ip,res.location.latitude,res.location.longitude,res.country.iso_code
        			ips[ip]=[(res.location.latitude,res.location.longitude)]
			except:
				print ip, "None","None","None","None"
				ips[ip]=[("N/A","N/A","N/A","N/A")]


if __name__ == '__main__':
    main()

