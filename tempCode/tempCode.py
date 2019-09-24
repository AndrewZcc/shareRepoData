
```python
def login_required(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        if session.get('w3account'):
            return func(*args, **kwargs)
        else:
            return redirect(url_for('main.login'))
    return wrapper
```
