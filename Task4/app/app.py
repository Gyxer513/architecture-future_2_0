from http.server import BaseHTTPRequestHandler, HTTPServer
import os

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        msg = f"Hello from {os.getenv('PROJECT_NAME')} ({os.getenv('ENVIRONMENT')})!"
        self.wfile.write(msg.encode())

if __name__ == "__main__":
    port = int(os.getenv("APP_PORT", 8080))
    with HTTPServer(("", port), Handler) as server:
        print(f"Serving on port {port}")
        server.serve_forever()