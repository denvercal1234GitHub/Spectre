###################################################################################
###  Segmentation 1 - process TIFFs
###################################################################################

    ### Load packages

        library(Spectre)

        package.check(type = 'spatial')
        package.load(type = 'spatial')

    ### Set PrimaryDirectory

        dirname(rstudioapi::getActiveDocumentContext()$path)            # Finds the directory where this script is located
        setwd(dirname(rstudioapi::getActiveDocumentContext()$path))     # Sets the working directory to where the script is located
        getwd()
        PrimaryDirectory <- getwd()
        PrimaryDirectory

    ### Set InputDirectory

        setwd(PrimaryDirectory)
        setwd("ROIs/")
        InputDirectory <- getwd()
        InputDirectory
        
    ### Create directory for Ilastik HDF5 files
        
        setwd(PrimaryDirectory)
        dir.create("masks")
        setwd("masks")
        MaskDirectory <- getwd()
        MaskDirectory
        
    ### Create directory for CROPPED Ilastik HDF5 files
        
        setwd(PrimaryDirectory)
        dir.create("cropped")
        setwd("cropped")
        CroppedDirectory <- getwd()
        CroppedDirectory
        
###################################################################################
### Check ROIs and TIFFs
###################################################################################

    ### Initialise the spatial data object with channel TIFF files

        setwd(InputDirectory)

        rois <- list.dirs(full.names = FALSE, recursive = FALSE)
        as.matrix(rois)

        tiff.list <- list()
        
        for(i in rois){
            setwd(InputDirectory)
            setwd(i)
            tiff.list[[i]] <- list.files(getwd())
        }
        
        t(as.data.frame(tiff.list))
        
###################################################################################
### Read in TIFF files and create spatial objects
###################################################################################        

        setwd(InputDirectory)
        
        spatial.dat <- read.spatial.files(rois = rois, roi.loc = getwd())
        
        str(spatial.dat, 3)
        spatial.dat[[1]]$RASTERS

###################################################################################
### Create HDF5 files for mask creation
###################################################################################          
        
        nms <- names(spatial.dat[[1]]$RASTERS)
        
        as.matrix(nms)
        for.ilastik <- nms[c(3:15)]
        as.matrix(for.ilastik)
        
        as.matrix(for.ilastik)
        merge.channels <- for.ilastik[c(2:8)]
        as.matrix(merge.channels)
        
        ## Whole ROIs for Ilastik
        
        setwd(MaskDirectory)
        write.hdf5(dat = spatial.dat, 
                   channels = for.ilastik, 
                   merge.channels = merge.channels,
                   plots = FALSE)
        
        ## Cropped ROIs to train Ilastik
        
        setwd(CroppedDirectory)
        write.hdf5(dat = spatial.dat, 
                   channels = for.ilastik, 
                   merge.channels = merge.channels,
                   random.crop.x = 350, 
                   random.crop.y = 300, 
                   plots = FALSE)
        
