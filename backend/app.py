from flask import Flask, request, jsonify
from flask_cors import CORS
import redis

app = Flask(__name__)
CORS(app)

r = redis.Redis(host='redis', port=6379, db=0)

@app.route('/todos', methods=['GET', 'POST'])
def todos():
    if request.method == 'POST':
        data = request.get_json()
        r.incr('id')
        id = r.get('id').decode()
        r.hset(id, 'task', data['task'])
        r.hset(id, 'status', 'incomplete')
        return jsonify({'id': id, 'task': data['task'], 'status': 'incomplete'})
    else:
        all_todos = []
        for id in r.keys():
            if r.type(id) == b'hash':
                todo = r.hgetall(id)
                todo = {k.decode(): v.decode() for k, v in todo.items()}
                todo["id"] = id.decode()
                all_todos.append(todo)
        return jsonify(all_todos)

@app.route('/todos/<id>', methods=['GET', 'PUT', 'DELETE'])
def todo(id):
    if request.method == 'PUT':
        data = request.get_json()
        r.hset(id, 'task', data['task'])
        r.hset(id,'status', data['status'])
        return jsonify({'id': id, 'task': data['task'], 'status': data['status']})
    elif request.method == 'DELETE':
        r.delete(id)
        return jsonify({'message': 'Deleted'})
    else:
        todo = r.hgetall(id)
        todo = {k.decode(): v.decode() for k, v in todo.items()}
        return jsonify(todo)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
