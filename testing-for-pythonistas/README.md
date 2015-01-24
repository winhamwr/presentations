## Building this presentation

### Install And Run ipython notebook

Following [these](http://nbviewer.ipython.org/github/fperez/nb-slideshow-template/blob/master/install-support.ipynb) instructions.

`
$ mkvitualenv tfp
$ pip install ipython[all]
$ ipython notebook
`
### Running installer

Load the notebook cloned from [nb-slideshow-template](https://github.com/fperez/nb-slideshow-template/blob/master/install-support.ipynb).

Run all of the cells.

### 2.x version of IPython-notebook-extensions

Since we're using ipython 2.x,
we have to checkout the 2.x version of [IPython-notebook-extensions](https://github.com/ipython-contrib/IPython-notebook-extensions/branches).

`
$ cd ~/.ipython/profile_default/static/customer
$ git checkout 2.x
`

### Install live-reveal

`
$ workon tfp
$ git clone https://github.com/damianavila/live_reveal.git
$ cd live_reveal
$ python setup.py install
`

Do the things for [custom.js](https://github.com/damianavila/live_reveal/blob/master/custom.js).


