from flask import Flask, jsonify, render_template

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/api/hello")
def hello():
    return jsonify({
        "message": "Hello from Azure!",
        "status": "success"
    })


@app.route("/api/users")
def users():
    return jsonify({
        "users": [
            {
                "id": 1,
                "name": "John",
                "role": "Developer"
            },
            {
                "id": 2,
                "name": "Alice",
                "role": "Admin"
            },
            {
                "id": 3,
                "name": "Bob",
                "role": "Manager"
            }
        ]
    })


@app.route("/api/status")
def status():
    return jsonify({
        "application": "Azure Python Web App",
        "status": "running",
        "environment": "production"
    })


@app.route("/api/products")
def products():
    return jsonify([
        {
            "id": 101,
            "name": "Laptop",
            "price": 75000
        },
        {
            "id": 102,
            "name": "Phone",
            "price": 45000
        },
        {
            "id": 103,
            "name": "Tablet",
            "price": 30000
        }
    ])


@app.route("/api/health")
def health():
    return jsonify({
        "status": "healthy"
    })


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
