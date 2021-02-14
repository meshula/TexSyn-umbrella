TexSyn-umbrella references in the source code for TexSyn, LazyPredator, and OpenCV, builds them statically, and then binds it all together into a single product.

Do the following:

```sh
cd your/project/directory
git clone --recursive https://github.com/meshula/TexSyn-umbrella.git
cd TexSyn-umbrella
./bootstrap.sh
./build.sh
```

Next, you can go into the directory that appears, TexSyn-build/bin, and type ./TexSyn and it should start evolving.

You only have to run bootstrap once. It builds opencv. You can run build every time you change the source code.

