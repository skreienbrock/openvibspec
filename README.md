# How to build openvibspec/anaconda3

After downloading the Dockerfile into your build folder, change your present
working directory to that folder and invoke the following command:

    docker build . -t openvibspec/anaconda3

Docker will build the image without any further ado. If you encounter any
problems with your build, please contact the maintainers.

## Download / docker pull

To run openvibspec/anaconda3 you can just download the prepared image:

   docker pull openvibspec/anaconda3

You should be aware, that this image is quite big. (>7G)

## LINUX: running openvibspec/anaconda3

To run openvibspec/anaconda3 with docker invoke the following command:

    docker run -it -v <your-notebook-folder>:/opt/notebooks -p 8888:8888 openvibspec/anaconda3

**Prerequisites**
- *<your-notebook-folder>* should be writeable by user uid/gid 1000 (default image)

You'll be placed inside your instanciated docker container like so:

    (py38) localuser@8087de7548e8:~$

## WINDOWS: running openvibspec/anaconda3

If not already added, you should add your local notebook directory e.g. C:\Users\user\notebooks
to the File Sharing section inside of your docker-widget settings. *(Settings - Resources - File Sharing)*

Afterwards you can run the following command:

    docker run -it -v "C:\Users\user\notebooks:/opt/notebooks" -p 8888:8888 openvibspec/anaconda3

## using jupyter

Due to the inability of docker-containers not running graphical interfaces directly, the
invocation of jupyter notebook needs some arguments:

    (py38) localuser@8087de7548e8:~$ jupyter notebook --ip="*" --no-browser --notebook-dir=/opt/notebooks

The notebook should start like this:

    [I 09:22:33.052 NotebookApp] Jupyter Notebook 6.4.0 is running at:
    [I 09:22:33.052 NotebookApp] http://8087de7548e8:8888/?token=c061d3ebe26dbcc83bd661740b6e2fee3d8c84373fafa3f5
    [I 09:22:33.052 NotebookApp]  or http://127.0.0.1:8888/?token=c061d3ebe26dbcc83bd661740b6e2fee3d8c84373fafa3f5
    [I 09:22:33.052 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
    [C 09:22:33.054 NotebookApp] 
        
        To access the notebook, open this file in a browser:
            file:///home/localuser/.local/share/jupyter/runtime/nbserver-25-open.html
        Or copy and paste one of these URLs:
            http://8087de7548e8:8888/?token=c061d3ebe26dbcc83bd661740b6e2fee3d8c84373fafa3f5
        or http://127.0.0.1:8888/?token=c061d3ebe26dbcc83bd661740b6e2fee3d8c84373fafa3f5

You have to manually copy the last line to your address-bar of your preferred browser:

    http://127.0.0.1:8888/?token=c061d3ebe26dbcc83bd661740b6e2fee3d8c84373fafa3f5

Enjoy,
