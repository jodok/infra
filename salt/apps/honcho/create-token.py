#!/usr/bin/env python3
"""Generate a JWT API token for Honcho.

Reads AUTH_JWT_SECRET from the .env file in the same directory.

Usage:
    python3 create-token.py
    python3 create-token.py --app-id myapp
"""

import argparse
import os
import sys

try:
    import jwt
except ImportError:
    print("Error: PyJWT not installed. Run: pip3 install pyjwt", file=sys.stderr)
    sys.exit(1)


def read_jwt_secret(env_path):
    with open(env_path) as f:
        for line in f:
            line = line.strip()
            if line.startswith("AUTH_JWT_SECRET="):
                return line.split("=", 1)[1]
    return None


def main():
    parser = argparse.ArgumentParser(description="Generate a Honcho JWT API token")
    parser.add_argument("--app-id", default="", help="Application ID to embed in the token")
    parser.add_argument("--admin", action="store_true", default=True, help="Create an admin token (default)")
    parser.add_argument("--env-file", default=None, help="Path to .env file")
    args = parser.parse_args()

    env_file = args.env_file or os.path.join(os.path.dirname(os.path.abspath(__file__)), ".env")
    secret = read_jwt_secret(env_file)
    if not secret:
        print(f"Error: AUTH_JWT_SECRET not found in {env_file}", file=sys.stderr)
        sys.exit(1)

    token = jwt.encode({"t": args.app_id, "ad": args.admin}, secret, algorithm="HS256")
    print(token)


if __name__ == "__main__":
    main()
