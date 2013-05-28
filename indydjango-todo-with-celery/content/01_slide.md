!SLIDE bullets
# What is a Task Queue?

* Separates requesting work from doing it
* Queue holds requested actions
* Workers perform them and maybe give results

!SLIDE bullets
# What are Celery and Jobtastic

* [Celery](http://www.celeryproject.org/): Distributed task queue of awesome
* [Jobtastic](http://policystat.github.io/jobtastic/): Helpers for user-facing tasks

!SLIDE bullets
# Why do I need a Task Queue?

1. Request/Response Cycle is sacred
2. Slow things shouldn't make fast things slow
3. Timeouts are double bad

!SLIDE bullets
# Why: 1. Request/Response Cycle

* UWSGI workers are expensive
* Makes DDOS easy
* Target very small times or you're hosed

!SLIDE bullets
# Why: 2. Slow things

* Queues let you keep fast things fast
* Route around slow things
* Throttle them separately

!SLIDE bullets
# Why: 3. Timeouts

* Bad user experience
* Use resources anyway
* Difficult to debug

!SLIDE bullets
# todo-django: Demo

* [Demo](http://localhost:8000/profile/)

!SLIDE bullets
# todo-django Celery backend

* [settings.py](https://github.com/indypy/todo-django/pull/6/files#L4R150)
* [urls.py](https://github.com/indypy/todo-django/pull/6/files#L11L40)
* [views.py](https://github.com/winhamwr/todo-django/blob/b9c0afda6fb346903c528461c4688c7b0acdb6b0/todo_django/views.py#L182)
* [tasks.py](https://github.com/winhamwr/todo-django/blob/b9c0afda6fb346903c528461c4688c7b0acdb6b0/todo_django/tasks.py)

!SLIDE bullets
# todo-django: Celery front-end

* [settings.py](https://github.com/indypy/todo-django/pull/6/files#L4R150)
* [javascript](https://github.com/winhamwr/todo-django/blob/b9c0afda6fb346903c528461c4688c7b0acdb6b0/todo_django/templates/site_base.html#L101)
