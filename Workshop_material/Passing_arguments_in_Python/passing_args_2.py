import argparse

def parse_args():
	
	parser = argparse.ArgumentParser()
	
	# argument 'esr'
	parser.add_argument('-e', '--esr', required=True, help="""Name of one of your fellow ESR.""")
	
	# argument 'compliment'
	parser.add_argument('-c', '--compliment', required=True, help="""Compliment that you want to make to this ESR""")
	
	# argument 'gift'
	parser.add_argument('-g', '--gift', required=True, help="""Gift that you want to give to this ESR""")
	
	return parser.parse_args()

args = parse_args()	
	
print("{0} is {1}. When I visit this ESR, I will bring a {2}.".format(args.esr, args.compliment, args.gift))
