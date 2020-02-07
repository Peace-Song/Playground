import argparse

parser = argparse.ArgumentParser(description='My description')
parser.add_argument('-a', required=True, help='help1')

opt = parser.parse_args()
print(opt)
