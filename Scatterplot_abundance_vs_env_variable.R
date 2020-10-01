# A quick function to turn a phyloseq object into a scatter plot 
# Useful to plot abundance of key taxa against environmental variables 
# You'll need the phyloseq and ggplot2 libraries loaded
  #library(phyloseq)
  #library(ggplot2)
# This is adapted from the other phyloseq wrapper functions found here:
# (https://github.com/joey711/phyloseq/blob/master/R/plot-methods.R)
#
# @param x The environmental variable to plot on the X-axis
# @param y Plot taxa abundance on the Y axis
# @param color Variable used to color points 
# @param title Optional title of plot 
# @param facet_grid Optional variable to facet the output

plot_scatter = function(phyloseqObj, x="EnvVariable", y="Abundance", color=NULL,
                    title=NULL, facet_grid=NULL){
  
  # Start by melting the data 
  mdf = psmelt(phyloseqObj)
  
  # Build the plot object
  p = ggplot(mdf, aes_string(x=x, y=y, color=color))
  
  # Add the ggplot object for the base graphic.
  p = p + geom_point()
  
  # By default, rotate the x-axis labels in case they're long.
  p = p + theme(axis.text.x=element_text(angle=-90, hjust=0))
  
  # Add faceting, if given
  if( !is.null(facet_grid) ){	
    p <- p + facet_grid(facet_grid)
  }
  
  # Add a title to the plot, if given
  if( !is.null(title) ){
    p <- p + ggtitle(title)
  }
  
  return(p)
}
