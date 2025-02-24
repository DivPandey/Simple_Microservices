from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/orders')
def get_orders():
    orders = [
        {"id": 1, "product": "Product 1", "user_id": 1},
        {"id": 2, "product": "Product 2", "user_id": 2}
    ]
    return jsonify(orders)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082)